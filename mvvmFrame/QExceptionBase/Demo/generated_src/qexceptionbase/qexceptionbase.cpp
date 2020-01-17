#include "qexceptionbase.h"
using namespace generated;

void QExceptionBase::raise() const
{
	throw *this;
}

QExceptionBase::Base *QExceptionBase::clone() const
{
	return new QExceptionBase{*this};
}
