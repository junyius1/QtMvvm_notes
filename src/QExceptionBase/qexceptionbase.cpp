#include "qexceptionbase.h"
//Q_EXCEPTION_BASE_NS_USING

void QExceptionBase::raise() const
{
	throw *this;
}

QExceptionBase::Base *QExceptionBase::clone() const
{
	return new QExceptionBase{*this};
}
