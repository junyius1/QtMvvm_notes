#include "myexception.h"
#ifdef USE_EXC_NS
using namespace generated;
#endif

MyException::MyException(QByteArray message) :
	_msg{std::move(message)}
{}

const char *MyException::what() const noexcept
{
	return _msg.constData();
}

void MyException::raise() const
{
	throw *this;
}

QExceptionBase::Base *MyException::clone() const
{
	return new MyException{*this};
}
