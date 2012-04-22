JCPriorityQueue
===============

A pure Cocoa implementation of a priority queue.

 * ARC
 * Unit tested
 
### Making it faster

It's likely that the performance of NSMutableArray could be improved by replacing the underlying data structures with something one of the C++ algorithms.

The best option is the C++ [priority_queue][1] or a heap in an implementation like [Mike Ash's example][2].

I've started to implement an [experimental heap backed priority queue][4] on another branch.

(Thanks to [Oliver Jones][3] for the Mike Ash tip off)

##### by Jesse Collis <jesse@jcmultimedia.com.au>

[1]: http://www.sgi.com/tech/stl/priority_queue.html "STL Priority Queue"
[2]: http://www.mikeash.com/pyblog/using-evil-for-good.html "Mike Ash - Using Evil for Good"
[3]: https://github.com/orj "Oliver Jones on GitHub"
[4]: https://github.com/jessedc/JCPriorityQueue/tree/experimental/heap-queue "Experimental heap backed cocoa priority queue"