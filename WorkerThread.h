#ifndef WORKERTHREAD_H
#define WORKERTHREAD_H
#include <QThread>
class WorkerThread: public QThread
{
    Q_OBJECT
public:
    using QThread::QThread;
    ~WorkerThread() override {
        requestInterruption();
        quit();
        wait();
    }
signals:
    void textChanged(const QString &);
protected:
    void run() override{
        while (!isInterruptionRequested()) {
            emit textChanged(QString("set by backend: %1 ").arg(counter));
            QThread::msleep(100);
            counter++;
        }
    }
private:
    int counter = 0;
};


#endif // WORKERTHREAD_H
