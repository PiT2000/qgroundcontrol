#ifndef TSURUMANAGER_H
#define TSURUMANAGER_H

#include <QObject>
#include "QGCToolbox.h"

class TsuruManager : public QGCTool
{
    Q_OBJECT
public:
    explicit TsuruManager(QGCApplication* app);
    ~TsuruManager();
    Q_PROPERTY(bool isEditor READ isEditor CONSTANT)
//    Q_PROPERTY(bool flightResolved READ flightResolved WRITE setFlightResolved NOTIFY flightResolvedChanged)
    Q_PROPERTY(QString missionPath READ missionPath WRITE setMissionPath NOTIFY missionPathChanged)
    Q_PROPERTY(QStringList missionList READ missionList WRITE setMissionList NOTIFY missionListChanged)

    bool isEditor(void) { return _isEditor; }

    QString missionPath() { return _missionPath; }
    QStringList missionList() { return _missionList; }


    // Override from QGCTool
    void setToolbox(QGCToolbox *toolbox);

public slots:
    void setMissionPath(QString value);
    void setMissionList(QStringList value) { _missionList = value; emit missionListChanged(value);}

private:
    bool _isEditor;
    QString _missionPath;
    QStringList _missionList;

signals:
    void missionPathChanged(QString value);
    void missionListChanged(QStringList value);
};

#endif // TSURUMANAGER_H
