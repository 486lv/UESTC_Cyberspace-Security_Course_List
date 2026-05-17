
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h> 
#include <ctype.h>


// 1. 定义与结构体
#define MAX_COUNT 2048 
#define MAX_NAME_LEN 17

// 错误代码
#define SIGN_UNDEFINED_ERR 1
#define SIGN_REDEFINED_ERR 2
#define SIGN_EXECUTE_ERR 3
#define NO_SIGN_ERR 4
#define SIGN_RESERVE_ERR 5
#define NO_PARA_ERR 6

// 类型枚举
typedef enum { integer } types;

// 变量表结构
typedef struct {
    char vname[MAX_NAME_LEN];
    char vproc[MAX_NAME_LEN];
    bool vkind; // false(0): 变量, true(1): 形参
    types vtype;
    int vlev;
    int vadr;
} varRecord;

// 过程表结构
typedef struct {
    char pname[MAX_NAME_LEN];
    types ptype;
    int plev;
    int varNum;
    int fadr;
    int ladr;
    int parameter; // 参数在input数组中的索引
    bool parameterIsDefined;
} proRecord;


// 2. 全局变量
char input[MAX_COUNT][MAX_NAME_LEN]; // 符号文本
int kind[MAX_COUNT];                 // 种别码
int inputCount = 0;
int pToken = 0;
int pChar = 0;

varRecord currentVar;
proRecord currentPro;

int lineNum = 1;
varRecord var[MAX_COUNT];
proRecord pro[MAX_COUNT];
int varCount = 0;
int proCount = 0;

FILE* inFile;
FILE* outFile;
FILE* errFile;
FILE* varFile;
FILE* proFile;


// 工具函数
bool init(int argc, char* argv[]);
bool final();
bool error(int errNum, const char* sign);
void getPath(char* in, char* out);
void getFilename(char* in, char* out);
bool nextToken();
bool nextChar();
bool isVarExisted(char* vname, char* vproc, bool vkind);
bool isProExisted(char* vname);
int getNextTokenIndex();

// 语法分析函数 
void parseProgram();
void parseBlock();
void parseDeclList();
void parseDeclListTail();
void parseDeclaration();
void parseVarDecl();
void parseVariable();
void parseIdentifier();
void parseFuncDecl();
void parseParameter();
void parseFuncBody();
void parseStmtList();
void parseStmtListTail();
void parseStatement();
void parseReadStmt();
void parseWriteStmt();
void parseAssignStmt();
void parseExpression();
void parseExpressionTail();
void parseTerm();
void parseTermTail();
void parseFactor();
void parseConstant();
void parseIfStmt();
void parseCondition();
void parseRelOp();
void parseFuncCall();


// 4. 主函数
int main(int argc, char* argv[]) {
    if (init(argc, argv)) {
        printf("Initialization success. Start parsing...\n");
        parseProgram(); // 入口
        if (final()) {
            printf("Analysis complete. Files generated.\n");
        }
        else {
            printf("Error closing files.\n");
        }
    }
    else {
        printf("Initialization failed. Please ensure input file exists.\n");
    }
    return 0;
}

//_______________________________________________________________________

void getPath(char* in, char* out) {
    char* name;
    char* lastSlash = strrchr(in, '\\');
    char* lastSlashUnix = strrchr(in, '/');
    if (lastSlashUnix > lastSlash) lastSlash = lastSlashUnix;

    if (lastSlash != NULL)
        strncpy(out, in, strlen(in) - strlen(lastSlash) + 1);
    else
        strcpy(out, "");
}

void getFilename(char* in, char* out) {
    char* fullName;
    char* extension;
    char* lastSlash = strrchr(in, '\\');
    char* lastSlashUnix = strrchr(in, '/');
    if (lastSlashUnix > lastSlash) lastSlash = lastSlashUnix;
    fullName = lastSlash;
    extension = strrchr(in, '.');

    if (fullName != NULL) {
        if (extension != NULL && extension > fullName)
            strncpy(out, fullName + 1, strlen(fullName) - 1 - strlen(extension));
        else
            strcpy(out, fullName + 1);
    }
    else {
        if (extension != NULL)
            strncpy(out, in, strlen(in) - strlen(extension));
        else
            strcpy(out, in);
    }
}

bool init(int argc, char* argv[]) {
    char inFilename[MAX_COUNT] = "output.dyd";
    if (argc > 1) {
        strcpy(inFilename, argv[1]);
    }

    char outFilename[MAX_COUNT] = "";
    char errFilename[MAX_COUNT] = "";
    char varFilename[MAX_COUNT] = "";
    char proFilename[MAX_COUNT] = "";
    char filename[MAX_COUNT] = "";
    char path[MAX_COUNT] = "";

    getFilename(inFilename, filename);
    getPath(inFilename, path);

    strcpy(outFilename, path); strcat(outFilename, filename); strcat(outFilename, ".dys");
    strcpy(errFilename, path); strcat(errFilename, filename); strcat(errFilename, ".err");
    strcpy(varFilename, path); strcat(varFilename, filename); strcat(varFilename, ".var");
    strcpy(proFilename, path); strcat(proFilename, filename); strcat(proFilename, ".pro");

    inFile = fopen(inFilename, "r");
    outFile = fopen(outFilename, "w");
    errFile = fopen(errFilename, "w");
    varFile = fopen(varFilename, "w");
    proFile = fopen(proFilename, "w");

    if (inFile && outFile && errFile && varFile && proFile) {
        inputCount = 0;
        pToken = 0;
        pChar = 0;
        lineNum = 1;

        strcpy(currentPro.pname, "");
        currentPro.plev = 0;
        currentPro.varNum = 0;
        currentPro.parameter = -1;

        varCount = 0;
        proCount = 0;

        char stringOfLine[MAX_COUNT];
        while (fgets(stringOfLine, MAX_COUNT, inFile)) {
            stringOfLine[strcspn(stringOfLine, "\n")] = 0;
            if (strlen(stringOfLine) == 0) continue;

            char* lastSpace = strrchr(stringOfLine, ' ');
            if (lastSpace) {
                kind[inputCount] = atoi(lastSpace + 1);
                *lastSpace = '\0';
                strcpy(input[inputCount], stringOfLine);
                inputCount++;
            }
        }
        return true;
    }
    else {
        if (inFile) fclose(inFile);
        if (outFile) fclose(outFile);
        if (errFile) fclose(errFile);
        if (varFile) fclose(varFile);
        if (proFile) fclose(proFile);
        return false;
    }
}

bool final() {
    for (int i = 0; i < varCount; i++) {
        int vkind = var[i].vkind ? 1 : 0;
        char* vtype = (var[i].vtype == integer) ? "integer" : "";
        fprintf(varFile, "%-16s %-16s %d %-8s %d %d\n",
            var[i].vname, var[i].vproc, vkind, vtype, var[i].vlev, var[i].vadr);
    }
    for (int i = 0; i < proCount; i++) {
        char* ptype = (pro[i].ptype == integer) ? "integer" : "";
        fprintf(proFile, "%-16s %-8s %d %d %d\n",
            pro[i].pname, ptype, pro[i].plev, pro[i].fadr, pro[i].ladr);
    }

    rewind(inFile);
    int ch;
    while ((ch = fgetc(inFile)) != EOF) {
        fputc(ch, outFile);
    }

    fclose(inFile);
    fclose(outFile);
    fclose(errFile);
    fclose(varFile);
    fclose(proFile);
    return true;
}

bool error(int errNum, const char* symbol)
{
    if (!symbol) symbol = "";
    switch (errNum)
    {
    case SIGN_UNDEFINED_ERR:
        fprintf(errFile, "***LINE:%d Symbol '%s' is undefined\n", lineNum, input[pToken]);
        break;
    case SIGN_REDEFINED_ERR:
        fprintf(errFile, "***LINE:%d Symbol '%s' is redefined\n", lineNum, input[pToken]);
        break;
    case SIGN_EXECUTE_ERR:
        fprintf(errFile, "***LINE:%d Unexpected token '%s' in statement\n", lineNum, input[pToken]);
        break;
    case NO_SIGN_ERR:
        fprintf(errFile, "***LINE:%d Missing '%s' before '%s'\n", lineNum, symbol, input[pToken]);
        break;
    case SIGN_RESERVE_ERR:
        fprintf(errFile, "***LINE:%d Starts with reserved word\n", lineNum);
        break;
    case NO_PARA_ERR:
        fprintf(errFile, "***LINE:%d Missing declaration for parameter '%s'\n", lineNum, symbol);
        break;
    default:
        fprintf(errFile, "***LINE:%d Unknown error\n", lineNum);
    }
    return true;
}

bool nextToken() {
    pToken++;
    pChar = 0;
    if (pToken >= inputCount || strcmp(input[pToken], "EOF") == 0) {
        return true;
    }
    while (pToken < inputCount && strcmp(input[pToken], "EOLN") == 0) {
        pToken++;
        lineNum++;
    }
    return false;
}

bool nextChar() {
    if (input[pToken][pChar] == '\0') return true;
    pChar++;
    return false;
}

bool isVarExisted(char* vname, char* vproc, bool vkind) {
    for (int i = 0; i < varCount; i++) {
        if ((strcmp(vname, var[i].vname) == 0) &&
            (strcmp(vproc, var[i].vproc) == 0) &&
            (var[i].vkind == vkind))
            return true;
    }
    for (int i = 0; i < proCount; i++) {
        if (strcmp(vname, pro[i].pname) == 0)
            return true;
    }
    return false;
}

bool isProExisted(char* vname) {
    for (int i = 0; i < varCount; i++) {
        if (strcmp(vname, var[i].vname) == 0) return true;
    }
    for (int i = 0; i < proCount; i++) {
        if (strcmp(vname, pro[i].pname) == 0) return true;
    }
    return false;
}

int getNextTokenIndex() {
    int pNext = pToken + 1;
    while (pNext < inputCount && strcmp(input[pNext], "EOLN") == 0) {
        pNext++;
    }
    return pNext;
}

// 6. 语法分析核心函数 (重命名版)


void parseProgram() {
    parseBlock();
}

void parseBlock() {
    if (strcmp(input[pToken], "begin") == 0) {
        nextToken();
    }
    else {
        error(NO_SIGN_ERR, "begin");
        if (strcmp(input[pToken], "integer") != 0) {
            nextToken();
        }
    }

    parseDeclList();

    if (strcmp(input[pToken], ";") == 0) {
        nextToken();
    }
    else {
        error(NO_SIGN_ERR, ";");
        if ((strcmp(input[pToken], "integer") != 0) &&
            (strcmp(input[pToken], "read") != 0) &&
            (strcmp(input[pToken], "write") != 0) &&
            (kind[pToken] != 10)) {
            nextToken();
        }
    }

    parseStmtList();

    if (strcmp(input[pToken], "end") == 0) {
        nextToken();
    }
    else {
        error(NO_SIGN_ERR, "end");
    }
}

void parseDeclList() {
    parseDeclaration();
    parseDeclListTail();
}

void parseDeclListTail() {
    int nextIdx = getNextTokenIndex();
    if (nextIdx < inputCount &&
        strcmp(input[pToken], ";") == 0 &&
        strcmp(input[nextIdx], "integer") == 0) {

        nextToken();
        parseDeclaration();
        parseDeclListTail();
    }
    else {
        if (strcmp(input[pToken], "integer") == 0) {
            error(NO_SIGN_ERR, ";");
            parseDeclaration();
            parseDeclListTail();
        }
    }
}

void parseDeclaration() {
    int nextIdx = getNextTokenIndex();
    if (nextIdx < inputCount && strcmp(input[nextIdx], "function") == 0) {
        parseFuncDecl();
    }
    else {
        parseVarDecl();
    }
}


void parseVarDecl()
{
    if (strcmp(input[pToken], "integer") == 0) {
        nextToken();
    }
    else {
        error(NO_SIGN_ERR, "integer");
        nextToken();
    }

    strcpy(currentVar.vname, input[pToken]);
    strcpy(currentVar.vproc, currentPro.pname);


    if (currentPro.parameter != -1 &&
        strcmp(input[pToken], input[currentPro.parameter]) == 0)
    {
        currentVar.vkind = true;
        currentPro.parameterIsDefined = true;
    }
    else
    {
        currentVar.vkind = false;
    }

    currentVar.vtype = integer;
    currentVar.vlev = currentPro.plev;
    currentVar.vadr = varCount;

    if (isVarExisted(input[pToken], currentPro.pname, currentVar.vkind)) {
        error(SIGN_REDEFINED_ERR, NULL);
    }
    else {
        if (currentPro.varNum == 0) {
            currentPro.fadr = currentVar.vadr;
        }
        currentPro.ladr = currentVar.vadr;
        currentPro.varNum++;
        var[varCount] = currentVar;
        varCount++;
    }

    parseVariable();
}


void parseVariable() {
    parseIdentifier();
}


void parseIdentifier() {
    if (kind[pToken] == 10) {
        nextToken();
    }
}


void parseFuncDecl() {
    proRecord proBackup = currentPro;

    if (strcmp(input[pToken], "integer") == 0) nextToken();
    else {
        error(NO_SIGN_ERR, "integer");
        if (strcmp(input[pToken], "function") != 0) nextToken();
    }

    if (strcmp(input[pToken], "function") == 0) nextToken();
    else {
        error(NO_SIGN_ERR, "function");
        if (kind[pToken] != 10) nextToken();
    }

    strcpy(currentPro.pname, input[pToken]);
    currentPro.ptype = integer;
    currentPro.plev++;
    currentPro.varNum = 0;
    currentPro.parameterIsDefined = false;

    if (isProExisted(input[pToken])) {
        error(SIGN_REDEFINED_ERR, NULL);
    }

    parseIdentifier();

    if (strcmp(input[pToken], "(") == 0) nextToken();
    else {
        error(NO_SIGN_ERR, "(");
        if (kind[pToken] != 10) nextToken();
    }

    currentPro.parameter = pToken;
    parseParameter();

    if (strcmp(input[pToken], ")") == 0) nextToken();
    else {
        error(NO_SIGN_ERR, ")");
        if (strcmp(input[pToken], ";") != 0) nextToken();
    }

    if (strcmp(input[pToken], ";") == 0) nextToken();
    else {
        error(NO_SIGN_ERR, ";");
        if (strcmp(input[pToken], "begin") != 0) nextToken();
    }

    parseFuncBody();

    currentPro = proBackup;
}


void parseParameter() {
    parseVariable();
}


void parseFuncBody() {
    if (strcmp(input[pToken], "begin") == 0) nextToken();
    else {
        error(NO_SIGN_ERR, "begin");
        if (strcmp(input[pToken], "integer") != 0) nextToken();
    }

    parseDeclList();

    if (!currentPro.parameterIsDefined) {
        error(NO_PARA_ERR, input[currentPro.parameter]);
    }

    pro[proCount] = currentPro;
    proCount++;

    if (strcmp(input[pToken], ";") == 0) nextToken();
    else {
        error(NO_SIGN_ERR, ";");
        if ((strcmp(input[pToken], "integer") != 0) &&
            (strcmp(input[pToken], "read") != 0) &&
            (strcmp(input[pToken], "write") != 0) &&
            (kind[pToken] != 10)) {
            nextToken();
        }
    }

    parseStmtList();

    if (strcmp(input[pToken], "end") == 0) nextToken();
    else {
        error(NO_SIGN_ERR, "end");
        if ((strcmp(input[pToken], ";") != 0) && (strcmp(input[pToken], "end") != 0)) {
            nextToken();
        }
    }
}


void parseStmtList() {
    parseStatement();
    parseStmtListTail();
}


void parseStmtListTail()
{
    if (strcmp(input[pToken], ";") == 0)
    {
        nextToken();
        parseStatement();
        parseStmtListTail();
    }
    else
    {
        // !!!!防死循环 (strlen Check)
        if ((strcmp(input[pToken], "end") != 0) &&
            (strcmp(input[pToken], "EOF") != 0) &&
            (strlen(input[pToken]) > 0) &&
            (pToken < inputCount))
        {
            error(NO_SIGN_ERR, ";");

            int currentPos = pToken;
            parseStatement();
            if (pToken == currentPos) {
                nextToken();
            }
            parseStmtListTail();
        }
    }
}


void parseStatement() {
    if (strcmp(input[pToken], "read") == 0) {
        parseReadStmt();
    }
    else if (strcmp(input[pToken], "write") == 0) {
        parseWriteStmt();
    }
    else if (strcmp(input[pToken], "if") == 0) {
        parseIfStmt();
    }
    else if (kind[pToken] == 10) {
        parseAssignStmt();
    }
    else {
        error(SIGN_EXECUTE_ERR, NULL);
        nextToken();
    }
}


void parseReadStmt() {
    if (strcmp(input[pToken], "read") == 0) nextToken();
    else {
        error(NO_SIGN_ERR, "read");
        if (strcmp(input[pToken], "(") != 0) nextToken();
    }

    if (strcmp(input[pToken], "(") == 0) nextToken();
    else {
        error(NO_SIGN_ERR, "(");
        if (kind[pToken] != 10) nextToken();
    }

    if (!isVarExisted(input[pToken], currentPro.pname, false) &&
        !isVarExisted(input[pToken], currentPro.pname, true)) {
        error(SIGN_UNDEFINED_ERR, NULL);
    }

    parseVariable();

    if (strcmp(input[pToken], ")") == 0) nextToken();
    else {
        error(NO_SIGN_ERR, ")");
        if (strcmp(input[pToken], ";") != 0 && strcmp(input[pToken], "end") != 0) nextToken();
    }
}


void parseWriteStmt() {
    if (strcmp(input[pToken], "write") == 0) nextToken();
    else {
        error(NO_SIGN_ERR, "write");
        if (strcmp(input[pToken], "(") != 0) nextToken();
    }

    if (strcmp(input[pToken], "(") == 0) nextToken();
    else {
        error(NO_SIGN_ERR, "(");
        if (kind[pToken] != 10) nextToken();
    }

    if (!isVarExisted(input[pToken], currentPro.pname, false) &&
        !isVarExisted(input[pToken], currentPro.pname, true)) {
        error(SIGN_UNDEFINED_ERR, NULL);
    }

    parseVariable();

    if (strcmp(input[pToken], ")") == 0) nextToken();
    else {
        error(NO_SIGN_ERR, ")");
        if (strcmp(input[pToken], ";") != 0 && strcmp(input[pToken], "end") != 0) nextToken();
    }
}


void parseAssignStmt() {
    if (!isVarExisted(input[pToken], currentPro.pname, false) &&
        !isVarExisted(input[pToken], currentPro.pname, true) &&
        !isProExisted(input[pToken])) {
        error(SIGN_UNDEFINED_ERR, NULL);
    }

    parseVariable();

    if (strcmp(input[pToken], ":=") == 0) nextToken();
    else {
        error(NO_SIGN_ERR, ":=");
        if (kind[pToken] != 10 && kind[pToken] != 11) nextToken();
    }

    parseExpression();
}


void parseExpression() {
    parseTerm();
    parseExpressionTail();
}


void parseExpressionTail() {
    if (strcmp(input[pToken], "-") == 0) {
        nextToken();
        parseTerm();
        parseExpressionTail();
    }
    else if (kind[pToken] == 10 || kind[pToken] == 11) {
        parseTerm();
        parseExpressionTail();
    }
}


void parseTerm() {
    parseFactor();
    parseTermTail();
}


void parseTermTail() {
    if (strcmp(input[pToken], "*") == 0) {
        nextToken();
        parseFactor();
        parseTermTail();
    }
    else if (kind[pToken] == 10 || kind[pToken] == 11) {
        parseFactor();
        parseTermTail();
    }
}


void parseFactor() {
    if (isdigit(input[pToken][0])) {
        parseConstant();
    }
    else {
        int nextIdx = getNextTokenIndex();
        if (nextIdx < inputCount && strcmp(input[nextIdx], "(") == 0) {
            parseFuncCall();
        }
        else {
            if (!isVarExisted(input[pToken], currentPro.pname, false) &&
                !isVarExisted(input[pToken], currentPro.pname, true)) {
                error(SIGN_UNDEFINED_ERR, NULL);
            }
            parseVariable();
        }
    }
}

void parseConstant() {
    if (kind[pToken] == 11) nextToken();
    else if (isdigit(input[pToken][0])) nextToken();
}


void parseIfStmt() {
    if (strcmp(input[pToken], "if") == 0) nextToken();
    else {
        error(NO_SIGN_ERR, "if");
        if (kind[pToken] != 10 && kind[pToken] != 11) nextToken();
    }

    parseCondition();

    if (strcmp(input[pToken], "then") == 0) nextToken();
    else {
        error(NO_SIGN_ERR, "then");
        if (strcmp(input[pToken], "integer") != 0 && strcmp(input[pToken], "read") != 0 && kind[pToken] != 10) nextToken();
    }

    parseStatement();

    if (strcmp(input[pToken], "else") == 0) nextToken();
    else {
        error(NO_SIGN_ERR, "else");
        if (strcmp(input[pToken], "integer") != 0 && strcmp(input[pToken], "read") != 0 && kind[pToken] != 10) nextToken();
    }

    parseStatement();
}


void parseCondition() {
    parseExpression();
    parseRelOp();
    parseExpression();
}


void parseRelOp() {
    if (strcmp(input[pToken], "<") == 0 ||
        strcmp(input[pToken], "<=") == 0 ||
        strcmp(input[pToken], ">") == 0 ||
        strcmp(input[pToken], ">=") == 0 ||
        strcmp(input[pToken], "=") == 0 ||
        strcmp(input[pToken], "<>") == 0) {
        nextToken();
    }
    else {
        error(NO_SIGN_ERR, "关系运算符");
        if (kind[pToken] != 10 && kind[pToken] != 11) nextToken();
    }
}


void parseFuncCall() {
    if (!isProExisted(input[pToken])) {
        error(SIGN_UNDEFINED_ERR, NULL);
    }

    parseIdentifier();

    if (strcmp(input[pToken], "(") == 0) nextToken();
    else {
        error(NO_SIGN_ERR, "(");
        if (kind[pToken] != 10 && kind[pToken] != 11) nextToken();
    }

    parseExpression();

    if (strcmp(input[pToken], ")") == 0) nextToken();
    else {
        error(NO_SIGN_ERR, ")");
        if (strcmp(input[pToken], "-") != 0 && strcmp(input[pToken], "*") != 0 && strcmp(input[pToken], ";") != 0) nextToken();
    }
}