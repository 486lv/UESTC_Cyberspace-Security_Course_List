#include "employee.h"


employee::employee(int id, string name, int state)
{
	this->m_id = id;
	this->m_name = name;
	this->m_state = state;
}
void employee::showInfo()
{
	cout << "职工编号：" << this->m_id << "\t职工姓名:" << this->m_name << "\t岗位:" << this->getStateName() << "\t岗位职责：完成经理给出的任务" <<endl;

}

string employee::getStateName()
{
	return string("员工");
}
