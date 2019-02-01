#include "rawimage.h"
#include <QPainter>
#include <QImage>
#include <QPaintDevice>

RawImage::RawImage(Qt3DCore::QNode *parent)
    : Qt3DRender::QPaintedTextureImage(parent),
      image_(":/test.jpg")
{
    qDebug() << "RawImage::RawImage()" << parent;
}

void RawImage::paint(QPainter *painter)
{
    qDebug() << "RawImage::paint()" << painter;
    if(image_.isNull())
    {
        qWarning() << "RawImage::paint: image is null";
        return;
    }
    setSize(image_.size());
    //int w = painter->device()->width();
    //int h = painter->device()->height();
    painter->drawImage(0, 0, image_);
}
