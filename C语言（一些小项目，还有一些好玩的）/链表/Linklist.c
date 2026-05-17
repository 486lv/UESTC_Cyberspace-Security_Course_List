#include <stdio.h>
#include <stdlib.h>
#include <string.h>
struct LinkNode
{
	int data;
	struct LinkNode* next;
};


//init初始化链表
struct LinkNode* Init_LinkNode()
{
	struct LinkNode* header = (struct LinkNode*)malloc(sizeof(struct LinkNode));
	header->data = -1;
	header->next = NULL;
	//尾部指针
	struct LinkNode* pRear = header;
	int val = -1;
	while (1)
	{
		printf("请输入插入的数据：\n");
		scanf_s("%d", &val);
		if (val == -1)
		{
			break;
		}
		//创建新节点
		struct LinkNode* newnode = (struct LinkNode*)malloc(sizeof(struct LinkNode));
		newnode->data = val;
		newnode->next = NULL;
		//new节点插入到链表中
		pRear->next = newnode;
		pRear = newnode;

	}
	return header;

}
//在oldval前面插入一个新的数据newval;
void InsertByValue_LinkList(struct LinkNode* header, int oldval, int newval)
{
	//判断参数
	if (header == NULL)//插到数据尾部也可以
	{

		return;//+
	}
	//双指针，一个pPrev,一个pCurrent	
	struct LinkNode* pPrev = header;
	struct LinkNode* pPcurrent = pPrev->next;
	while (pPcurrent != NULL)//赵到oldval
	{
		if (pPcurrent->data == oldval)
		{
			break;
		}
		pPrev = pPcurrent;
		pPcurrent = pPcurrent->next;
	}
	if (pPcurrent==NULL)//pCurrent为空，则不存在
	{
		return;
	}
	//创建新结点
	struct LinkNode* newnode = (struct LinkNode*)malloc(sizeof(struct LinkNode));
	newnode->data = newval;
	newnode->next = NULL;
	//新结点插入
	newnode->next = pPcurrent;
	pPrev->next = newnode;
}
//删除值为val的节点
void RemoveByValue_LinkList(struct LinkNode* header,int(delvalue))
{
	if (header == NULL)
	{
		return;
	}
	//两个辅助指针
	struct LinkNode* pPrev = header;
	struct LinkNode* pCurrent = pPrev->next;
	while (pCurrent != NULL)
	{
		if (pCurrent->data== delvalue)
		{
			return;
		}
		pPrev= pCurrent;
		pCurrent = pCurrent->next;
	}
	if (pCurrent == NULL)
	{
		return;
	}
	//重新建立带删除节点的前端和后端
	pPrev->next = pCurrent->next;//就是跳过中间的那个区域，把前后两个节点相连，就相当于删除
	free(pCurrent);
	pCurrent = NULL;


}
//遍历
void Foreach_LinkList(struct LinkNode* header)
{
	if (header == NULL)
	{
		return;
	}
	//辅助指针变量
	struct LinkNode* pCurrent = header->next;
	while (pCurrent != NULL)
	{
		printf("%d\n", pCurrent->data);
		pCurrent = pCurrent->next;
	}
}
//销毁
void Destroy_LinkList(struct LinkNode* header)
{
	if (header == NULL)
	{
		return;
	}
	struct LinkNode* pCurrent = header->next;
	while (pCurrent != NULL)
	{
		struct LinkNode* pNext = pCurrent->next;
		free(pCurrent);

		pCurrent = pNext;
	} 
}
//清空
void Clear_LinkList(struct LinkNode* header)
{
	if (header == NULL)
	{
		return 0;
	}
	struct LinkNode* pCurrent = header->next;
	while (pCurrent != NULL)
	{
		//先保存下一个节点的地址
		struct LinkNode* pNext = pCurrent->next;
		//释放当前内存
		free(pCurrent);
		pCurrent = pNext;
	}
	header->next = NULL;

}





int main()
{

	struct LinkNode* header = Init_LinkNode();
	Foreach_LinkList(header);
	void InsertByValue_LinkList(struct LinkNode* header, int oldval, int newval);
	return 0;
}




