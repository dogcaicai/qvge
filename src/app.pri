# This file is a part of
# QVGE - Qt Visual Graph Editor
#
# (c) 2016-2020 Ars L. Masiuk (ars.masiuk@gmail.com)
#
# It can be used freely, maintaining the information above.


# includes & libs
INCLUDEPATH += $$PWD $$PWD/3rdParty/qtpropertybrowser $$PWD/3rdParty/qsint-widgets


CONFIG(debug, debug|release){
	DESTDIR = $$OUT_PWD/../bin.debug
	LIBS += -L$$OUT_PWD/../lib.debug
}
else{
	DESTDIR = $$OUT_PWD/../bin
	LIBS += -L$$OUT_PWD/../lib
}


LIBS += -lcommonui -lqvge -lqvgeio -lqtpropertybrowser -lqsint-widgets

USE_LOCAL_OGDF{
    LIBS += -logdf-2020
}

USE_EXTERNAL_OGDF{
	LIBS += -l$$OGDF_LIB_NAME -L$$OGDF_LIB_PATH
	INCLUDEPATH += $$OGDF_INCLUDE_PATH
}

USE_GVGRAPH{
	LIBS += -lgvgraph
	#LIBS += $$GRAPHVIZ_LIBS -L$$GRAPHVIZ_LIB_PATH
}


win32{
    LIBS += -lopengl32 -lglu32 -lshell32 -luser32 -lpsapi
}

unix{
    !haiku{
		QT += x11extras
        LIBS += -lX11
    }
}

