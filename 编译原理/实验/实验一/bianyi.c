#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>   
#include <stdlib.h>   
#include <string.h>   
#include <ctype.h>    

// 全局变量
FILE* fin = NULL;     // 输入文件 (test.txt)
FILE* fout = NULL;    // 输出文件 (*.dyd)
FILE* ferr = NULL;    // 错误文件 (*.err)
int line_number = 1;  // 行号计数器

// 文件名常量
const char* INPUT_FILE = "test.txt";
const char* OUTPUT_DYD_FILE = "output.dyd";
const char* OUTPUT_ERR_FILE = "output.err";

// 单词种别码 
#define TOKEN_IDENTIFIER 10
#define TOKEN_CONSTANT 11
#define TOKEN_EOLN 24
#define TOKEN_EOF 25

// 关键字表（关键字字符串，对应的种别码）
typedef struct {
    const char* word; 
    int code;         
} Keyword;

// 根据PDF中的表格 
Keyword keywords[] = {
    {"begin", 1},
    {"end", 2},
    {"integer", 3},
    {"if", 4},
    {"then", 5},
    {"else", 6},
    {"function", 7},
    {"read", 8},
    {"write", 9}
};
// 关键字的数量
int num_keywords = sizeof(keywords) / sizeof(Keyword);


void output_token(const char* token, int code);
void output_error(const char* message);
int check_keyword(const char* token);
void scan();

int main() {
    // 打开输入文件
    fin = fopen(INPUT_FILE, "r");
    if (fin == NULL) {
        printf("错误: 无法打开输入文件 %s\n", INPUT_FILE);
        return 1;
    }

    // 打开输出文件
    fout = fopen(OUTPUT_DYD_FILE, "w");
    ferr = fopen(OUTPUT_ERR_FILE, "w");
    if (fout == NULL || ferr == NULL) {
        printf("错误: 无法创建输出文件\n");
        fclose(fin);
        return 1;
    }

    printf("词法分析开始...\n");

    // 启动词法分析
    scan();

    // 分析结束后，按要求写入 EOF 标志 
    output_token("EOF", TOKEN_EOF);

    // 关闭所有文件
    fclose(fin);
    fclose(fout);
    fclose(ferr);

    printf("词法分析完成。\n");
    printf("输出: %s\n", OUTPUT_DYD_FILE);
    printf("错误: %s\n", OUTPUT_ERR_FILE);

    return 0;
}

/**
 * @brief 词法分析器核心函数 (状态机)
 */
void scan() {
    int ch;                      // 当前读取的字符
    char token_buffer[256];      // 存放当前识别的单词
    int buffer_index;            // token_buffer 的索引
    char error_message[256];     // 错误信息缓冲区

    // 循环读取文件，直到文件末尾 (EOF)
    while ((ch = fgetc(fin)) != EOF) {
        // 清空单词缓冲区
        memset(token_buffer, 0, sizeof(token_buffer));
        buffer_index = 0;

        // 1. 状态：识别标识符或关键字 (以字母开头) [cite: 68]
        if (isalpha(ch)) {
            token_buffer[buffer_index++] = ch;

            // 继续读取，直到遇到非字母或非数字的字符
            while ((ch = fgetc(fin)) != EOF && (isalpha(ch) || isdigit(ch))) {
                token_buffer[buffer_index++] = ch;
            }

            // "回退"一个字符，因为多读了一个 [cite: 84]
            // 这个多读的字符将在下一次循环中被重新处理
            if (ch != EOF) {
                ungetc(ch, fin);
            }

            // 检查是关键字还是标识符
            int code = check_keyword(token_buffer);
            output_token(token_buffer, code);
        }

        // 2. 状态：识别常数 (以数字开头) [cite: 84]
        else if (isdigit(ch)) {
            token_buffer[buffer_index++] = ch;

            // 继续读取，直到遇到非数字的字符
            while ((ch = fgetc(fin)) != EOF && isdigit(ch)) {
                token_buffer[buffer_index++] = ch;
            }

            // 回退一个字符
            if (ch != EOF) {
                ungetc(ch, fin);
            }

            output_token(token_buffer, TOKEN_CONSTANT); // 11 是常数 
        }

        // 3. 状态：识别赋值符号 := (根据测试用例 [cite: 26, 30])
        else if (ch == ':') {
            int next_ch = fgetc(fin);
            if (next_ch == '=') {
                // 识别为 :=
                // 种别码 20 在表中是空缺的，用它来代表 :=
                output_token(":=", 20);
            }
            else {
                // 错误：单独的 ':' 是非法的
                sprintf(error_message, "非法字符 ':'");
                output_error(error_message);
                // 回退这个非 '=' 字符
                if (next_ch != EOF) {
                    ungetc(next_ch, fin);
                }
            }
        }

        // 4. 状态：识别 <, <=, <>
        else if (ch == '<') {
            int next_ch = fgetc(fin);
            if (next_ch == '=') {
                output_token("<=", 14); // 种别码 14 
            }
            else if (next_ch == '>') {
                output_token("<>", 15); // 种别码 15 
            }
            else {
                // 只是一个 '<'
                output_token("<", 16); // 种别码 16 
                if (next_ch != EOF) {
                    ungetc(next_ch, fin);
                }
            }
        }

        // 5. 状态：识别 >, >=
        else if (ch == '>') {
            int next_ch = fgetc(fin);
            if (next_ch == '=') {
                output_token(">=", 17); // 种别码 17 
            }
            else {
                // 只是一个 '>' (在文法中出现, 但表中没有)
                // 我们分配一个新码 26 (因为 25 是 EOF)
                output_token(">", 26);
                if (next_ch != EOF) {
                    ungetc(next_ch, fin);
                }
            }
        }

        // 6. 状态：处理换行符
        else if (ch == '\n') {
            output_token("EOLN", TOKEN_EOLN); // 
            line_number++; // 行号加 1
        }

        // 7. 状态：处理空白字符 (空格, 制表符等)
        else if (isspace(ch)) {
            // 忽略，什么也不做
        }

        // 8. 状态：处理其他单字符运算符或非法字符
        else {
            switch (ch) {
            case '=': output_token("=", 12); break;
            case ',': output_token(",", 13); break;
            case '-': output_token("-", 18); break;
            case '*': output_token("*", 19); break;
            case '(': output_token("(", 21); break;
            case ')': output_token(")", 22); break;
            case ';': output_token(";", 23); break;

            // 非法字符
            default:
                sprintf(error_message, "非法字符 '%c'", ch);
                output_error(error_message);
                break;
            }
        }
    }
}

void output_token(const char* token, int code) {
    if (fout) {
        fprintf(fout, "%s %d\n", token, code); // [cite: 46]
    }
}


void output_error(const char* message) {
    if (ferr) {
        // [cite: 58]
        fprintf(ferr, "LINE:%d %s\n", line_number, message);
    }
}

int check_keyword(const char* token) {
    for (int i = 0; i < num_keywords; i++) {
        if (strcmp(keywords[i].word, token) == 0) {
            return keywords[i].code; // 匹配成功，是关键字
        }
    }
    return TOKEN_IDENTIFIER; // 匹配失败，是标识符 
}