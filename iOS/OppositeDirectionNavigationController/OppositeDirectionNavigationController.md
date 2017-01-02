# How can we achieve opposite direction navigation controller?

Usually navigation controller segues from right to left. If we want the animation to segue from left to right, we need to follow the below steps:

1. Use [SOLPresentingFun Library](https://github.com/soleares/SOLPresentingFun)
2. Put following code.

```
self.navigationController?.delegate = self
func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    switch operation{
    case .Push where toVC.isKindOfClass("Your new View Controller class name"):
        let animator = SOLSlideTransitionAnimator()
        animator.appearing = true
        animator.duration = 0.25
        animator.edge = .Left //Direction from which you want to slide the new controller in
        return animator
    case .Pop where fromVC.isKindOfClass("Your new View Controller class name"):
	     let animator = SOLSlideTransitionAnimator()
        animator.appearing = false
        animator.duration = 0.25
        animator.edge = .Left//Direction to which you want to slide the new controller out
        return animator
    }
    return nil
}
```