(import-from concurrent.futures ThreadPoolExecutor as-completed)
(import-from random randint)

(import-from sh sleep)

(defn task-to-do [] (sleep (randint 1 5)))


(with-as (ThreadPoolExecutor 10) executor
         (setf jobs (list-comp (.submit executor task-to-do) (x (range 0 10))))
         (for (future (as-completed jobs))
           (.result future)))
