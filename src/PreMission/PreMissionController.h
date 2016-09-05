#ifndef PREMISSIONCONTROLLER_H
#define PREMISSIONCONTROLLER_H
#include <QObject>

class PreMissionController : public QObject
{
    Q_OBJECT
public:
    explicit PreMissionController(QObject *parent = 0);
    ~PreMissionController();

public slots:

signals:

};

#endif // PREMISSIONCONTROLLER_H
