#ifndef PREMISSIONCONTROLLER_H
#define PREMISSIONCONTROLLER_H

#include <QObject>
#include <QDir>


#include "QmlObjectListModel.h"

class PreMissionController : public QObject
{
    Q_OBJECT
public:
    PreMissionController(QObject *parent = 0);
    ~PreMissionController();

    Q_PROPERTY ( QStringList fileList READ fileList NOTIFY fileListChanged )
    Q_PROPERTY ( QString preMissionPath READ preMissionPath NOTIFY preMissionPathChanged )

    Q_INVOKABLE void loadFileList(void);

    QStringList fileList(void) {return _fileList; }
    QString preMissionPath(void) { return _preMissionPath; }

private:
    QStringList _fileList;
    QString _preMissionPath;

public slots:

signals:
    void fileListChanged(void);
    void preMissionPathChanged(void);
};

#endif // PREMISSIONCONTROLLER_H
