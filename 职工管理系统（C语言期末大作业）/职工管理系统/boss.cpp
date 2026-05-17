#include "boss.h"

boss::boss(int id, string name, int state)
{
	this->m_id = id;
	this->m_name = name;
	this->m_state = state;
}

void boss::showInfo()
{
	cout << "职工编号：" << this->m_id << "\t职工姓名:" << this->m_name << "\t岗位:" << this->getStateName() << "\t岗位职责：我是老板我自己布置任务" << endl;

}

string boss::getStateName()
{
	return string("老板");
}
