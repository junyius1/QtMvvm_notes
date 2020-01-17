#include <QCoreApplication>
#include <QDebug>
#include "myexception.h"
#ifdef USE_EXC_NS
using namespace generated;
#endif

int main(int argc, char *argv[])
{
	QCoreApplication a(argc, argv);

	try {
		throw MyException{"Hello World"};
	} catch (std::exception &e) {
		qDebug() << e.what();
	}

	try {
		throw MyException{"Hello Tree"};
	} catch (QExceptionBase &e) {
		qDebug() << e.what();
	}

	return 0;
}
