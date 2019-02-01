#ifndef RAWIMAGE_H
#define RAWIMAGE_H

#include <Qt3DRender/QPaintedTextureImage>

class RawImage : public Qt3DRender::QPaintedTextureImage
{
public:
    explicit RawImage(Qt3DCore::QNode *parent = nullptr);
    void paint(QPainter *painter) override;

private:
    QImage image_;
};

#endif // RAWIMAGE_H
