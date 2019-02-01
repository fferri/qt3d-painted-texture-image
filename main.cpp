#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <Qt3DQuickExtras/qt3dquickwindow.h>
#include <QQmlContext>
#include <QTimer>
#include "rawimage.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<RawImage>("com.test.RawImage", 1, 0, "RawImage");

#if 0
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
#else
    Qt3DExtras::Quick::Qt3DQuickWindow view;
    //view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setSource(QUrl("qrc:/MyScene.qml"));
    view.show();
#endif

    return app.exec();
}
