import QtQuick 2.2 as QQ2
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0
import com.test.RawImage 1.0
import QtQml 2.12

Entity {
    id: sceneRoot

    OrbitCameraController {
        camera: objectsCamera
    }

    RenderSettings {
        id: renderSettings
        activeFrameGraph: RenderSurfaceSelector {
            id: surfaceSelector
            ClearBuffers {
                buffers: ClearBuffers.ColorDepthBuffer
            }
            LayerFilter {
                layers: [
                    Layer {
                        id: backgroundLayer
                        CameraSelector {
                            camera: Camera {
                                id: backgroundCamera
                                projectionType: CameraLens.OrthographicProjection
                                left: -1
                                right: 1
                                bottom: -1
                                top: 1
                                nearPlane: 0.1
                                farPlane: 1000.0
                                position: Qt.vector3d(0, 0, 1)
                                viewCenter: Qt.vector3d(0, 0, 0)
                                upVector: Qt.vector3d(0, 1, 0)
                            }
                        }
                    }
                ]
            }
            LayerFilter {
                layers: [
                    Layer {
                        id: objectsLayer
                        Viewport {
                            CameraSelector {
                                camera: Camera {
                                    id: objectsCamera
                                    projectionType: CameraLens.PerspectiveProjection
                                    fieldOfView: 45.0
                                    aspectRatio: 1
                                    nearPlane: 0.1
                                    farPlane: 1000.0
                                    position: Qt.vector3d(0, 0, -40)
                                    viewCenter: Qt.vector3d(0, 0, 0)
                                    upVector: Qt.vector3d(0, 1, 0)
                                }
                                ClearBuffers {
                                    buffers: ClearBuffers.DepthBuffer
                                }
                            }
                        }
                    }
                ]
            }
        }
        //renderPolicy: RenderSettings.Always
    }

    InputSettings {
        id: inputSettings
    }

    components: [renderSettings, inputSettings]

    Entity {
        id: cuboidEntity
        PhongMaterial {
            id: material
        }
        CuboidMesh {
            id: cuboidMesh
            xExtent: 1
            yExtent: 2
            zExtent: 3
        }
        Transform {
            id: cuboidTransform
            scale3D: Qt.vector3d(1.5, 1, 0.5)
            property real u: 0.0
            rotationX: u * 5
            rotationY: u * 7
            rotationZ: u * 11
        }
        QQ2.NumberAnimation {
            target: cuboidTransform
            property: "u"
            duration: 50000
            from: 0
            to: 360
            loops: QQ2.Animation.Infinite
            running: true
        }
        components: [ cuboidMesh, material, cuboidTransform, objectsLayer ]
    }

    /*Timer {
        interval: 500
        running: true
        repeat: true
        onTriggered: img.update()
    }*/

    // rename this to 'img' to use my RawImage class
    RawImage {
        id: img
    }

    // rename this to 'img' to use QTextureImage class
    TextureImage {
        id: img0
        source: "test.jpg"
        mirrored: false
    }

    Entity {
        id: planeEntity
        PlaneMesh {
            id: planeMesh
            width: 2
            height: 2
        }
        TextureMaterial {
            id: planeMaterial
            texture: Texture2D {
                id: planeTexture
                textureImages: img
            }
        }
        Transform {
            id: planeTransform
            rotationX: 90
        }
        components: [planeMesh, planeMaterial, planeTransform, backgroundLayer]
    }
}
