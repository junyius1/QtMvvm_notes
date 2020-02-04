#!/usr/bin/env python3

import sys


def replace_header(in_path, out_path, namespace, export):
	with open(in_path, "r") as in_file:
		with open(out_path, "w") as out_file:
			for line in in_file:
				line = line.replace("QEXCEPTIONBASE_H", "{}_QEXCEPTIONBASE_H".format(namespace.upper()))
				line = line.replace("//Q_EXCEPTION_BASE_NS_BEGIN", "namespace {} {{".format(namespace))
				line = line.replace("//Q_EXCEPTION_BASE_NS_END", "}")
				line = line.replace("Q_EXCEPTION_BASE_EXPORT", export)
				out_file.write(line)


def replace_source(in_path, out_path, namespace):
	with open(in_path, "r") as in_file:
		with open(out_path, "w") as out_file:
			for line in in_file:
				line = line.replace("//Q_EXCEPTION_BASE_NS_USING", "using namespace {};".format(namespace))
				out_file.write(line)


def main():
	mode = sys.argv[1]
	if mode == "--hdr":
		return replace_header(sys.argv[2], sys.argv[3], sys.argv[4], sys.argv[5] if len(sys.argv) > 5 else "")
	elif mode == "--src":
		return replace_source(sys.argv[2], sys.argv[3], sys.argv[4])
	else:
		return 1


if __name__ == '__main__':
	sys.exit(main())
