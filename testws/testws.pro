# pure cpp console type does not have these two lines
QT += core
QT -= gui

CONFIG += c++11

TARGET = testws
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

SOURCES += main.cpp \

# -lboost_system -lcrypto
# -lpthread ??
# -fsanitize=address will make asan issue
LIBS +=  -lssl -lz -luv -luWS
# -DUWS_THREADSAFE will make build fail
QMAKE_CXXFLAGS +=  -Wno-unused-parameter
QMAKE_CXXFLAGS_RELEASE -= -O1
QMAKE_CXXFLAGS_RELEASE -= -O2
QMAKE_CXXFLAGS_RELEASE *= -O3 -g
INCLUDEPATH += ../src

# at least on Mac
INCLUDEPATH += /usr/local/opt/openssl/include
INCLUDEPATH += /usr/local/opt/libuv/include
INCLUDEPATH += /usr/local/include
LIBS += -L/usr/local/opt/openssl/lib
LIBS += -L/usr/local/opt/libuv/lib
LIBS += -L/usr/local/lib
# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
