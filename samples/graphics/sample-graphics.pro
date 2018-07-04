#--------------------------------------------------------------------
# path to build directory (generated by cmake)
#--------------------------------------------------------------------
PRE_TARGETDEPS += $$PWD/../../setup.pri
include($$PWD/../../setup.pri)

#--------------------------------------------------------------------
# project
#--------------------------------------------------------------------
QT -= core gui
TARGET = sample-graphics
TEMPLATE = app
CONFIG += c++11
CONFIG -= qt

DESTDIR = $$OUTPUT_DIR/bin
QMAKE_CLEAN += $$DESTDIR/$$TARGET

CONFIG(debug, debug|release):
    DEFINES += _DEBUG
DEFINES += GP_USE_GAMEPAD

INCLUDEPATH += $$OUTPUT_DIR/include/gplayengine/
INCLUDEPATH += $$OUTPUT_DIR/include/gplayengine/thirdparty

#--------------------------------------------------------------------
# platform specific
#--------------------------------------------------------------------
linux: {
    DEFINES += __linux__
    PRE_TARGETDEPS += $$OUTPUT_DIR/lib/libgplay-deps.a
    PRE_TARGETDEPS += $$OUTPUT_DIR/lib/libgplay.a
    LIBS += -L$$OUTPUT_DIR/lib/ -lgplay
    LIBS += -L$$OUTPUT_DIR/lib/thirdparty/ -lgplay-deps
    LIBS += -lm -lGL -lrt -ldl -lX11 -lpthread -lsndio
    QMAKE_POST_LINK += $$quote(rsync -rau $$PWD/game.config $${DESTDIR}/$${TARGET}.config$$escape_expand(\n\t))
}

#--------------------------------------------------------------------
# files
#--------------------------------------------------------------------
SOURCES += \
    src/SamplesGame.cpp \
    src/DrawStress.cpp \
    src/DynamicMesh.cpp \
    src/Instancing.cpp \
    src/Example.cpp \
    src/Cube.cpp \
    src/Sponza.cpp \
    src/FirstPersonCamera.cpp \
    src/RenderToTexture.cpp \
    src/ImGuiTest.cpp \
    src/SparkDemo.cpp \
    src/Transparency.cpp \
    src/ShaderReload.cpp \
    src/EventSample.cpp \
    src/LightsAndShadows.cpp \
    src/DeferredTest.cpp

HEADERS += \
    src/SamplesGame.h \
    src/DrawStress.h \
    src/DynamicMesh.h \
    src/Instancing.h \
    src/Example.h \
    src/Cube.h \
    src/FirstPersonCamera.h \
    src/RenderToTexture.h \
    src/ImGuiTest.h \
    src/SparkDemo.h \
