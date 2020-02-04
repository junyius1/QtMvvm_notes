#ifndef GENERATED_QEXCEPTIONBASE_H
#define GENERATED_QEXCEPTIONBASE_H

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

namespace generated {

class CUSTOM_EXPORT QExceptionBase : public Q_EXCEPTION_BASE_CLASS
{
public:
	using Base = Q_EXCEPTION_BASE_CLASS;

	virtual void raise() const Q_EXCEPTION_BASE_OR;
	virtual Base *clone() const Q_EXCEPTION_BASE_OR;
};

}

#endif // GENERATED_QEXCEPTIONBASE_H
