#ifndef QEXCEPTIONBASE_H
#define QEXCEPTIONBASE_H

#include <QtCore/QString>

#if !defined(QT_NO_EXCEPTIONS) && QT_CONFIG(future)
#include <QtCore/QException>
#define Q_EXCEPTION_BASE_CLASS QException
#define Q_EXCEPTION_BASE_OR override
#else
#include <exception>
#define Q_EXCEPTION_BASE_CLASS std::exception
#define Q_EXCEPTION_BASE_OR
#endif

//Q_EXCEPTION_BASE_NS_BEGIN

class Q_EXCEPTION_BASE_EXPORT QExceptionBase : public Q_EXCEPTION_BASE_CLASS
{
public:
	using Base = Q_EXCEPTION_BASE_CLASS;

	virtual void raise() const Q_EXCEPTION_BASE_OR;
	virtual Base *clone() const Q_EXCEPTION_BASE_OR;
};

//Q_EXCEPTION_BASE_NS_END

#endif // QEXCEPTIONBASE_H
