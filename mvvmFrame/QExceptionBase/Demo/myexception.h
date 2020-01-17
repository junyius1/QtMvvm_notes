#ifndef MYEXCEPTION_H
#define MYEXCEPTION_H

#include <QByteArray>

#include <qexceptionbase.h>

#ifdef USE_EXC_NS
namespace generated {
#endif

class MyException : public QExceptionBase
{
public:
	MyException(QByteArray message);

	const char *what() const noexcept override;
	void raise() const override;
	Base *clone() const override;

private:
	const QByteArray _msg;
};

#ifdef USE_EXC_NS
}
#endif

#endif // MYEXCEPTION_H
