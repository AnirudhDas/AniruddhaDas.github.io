# Find the middle of a linked list without traversing the entire list

I don't see how you could do it without traversing the entire list unless you know the length of the linked list before hand.

I'm guessing the answer wants two pointers; first pointer to be traversing one element at a time, while the second pointer moves 2 elements at a time.
This way when the second pointer reaches the end, the first pointer will be at the middle.