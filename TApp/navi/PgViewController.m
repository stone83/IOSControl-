
#import "PgViewController.h"

#define MYColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
@interface PgViewController () {
    NSArray *pages;
}

@property (strong, nonatomic) NSArray *pages;
@property (strong, nonatomic) UIPageViewController *pageController;

@end
@implementation PgViewController

@synthesize pageControl;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self buildUI];
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.view.backgroundColor = [UIColor redColor];
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor greenColor];
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor blueColor];
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor = [UIColor whiteColor];
    self.pages =@[
                  vc1,
                  vc2,
                  vc3,
                  vc4
                  ];
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    [self.pageController setDelegate:self];
    [self.pageController setDataSource:self];
    
    [[self.pageController view] setFrame:[[self view] bounds]];
    NSArray *viewControllers = [NSArray arrayWithObject:[self.pages objectAtIndex:0]];
    [self.pageControl setCurrentPage:0];
    [self.pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    
    [self.view addSubview:self.pageControl];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
    
    [self.view sendSubviewToBack:[self.pageController view]];
}

//也可不在viewControllerAfterViewController和viewControllerBeforeViewController中设置pageConroll,采取以下方法设置
//- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers
//{
//    NSInteger index= [self.pages indexOfObject:[pendingViewControllers objectAtIndex:0]];
//    [self.pageControl setCurrentPage:index];
//}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger currentIndex = [self.pages indexOfObject:viewController];
    [self.pageControl setCurrentPage:self.pageControl.currentPage+1];
    if ( currentIndex < [self.pages count]-1) {
        return [self.pages objectAtIndex:currentIndex+1];
    } else {
        return nil;
    }
}


- (UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger currentIndex = [self.pages indexOfObject:viewController];
    [self.pageControl setCurrentPage:self.pageControl.currentPage-1];
    if ( currentIndex > 0) {
        return [self.pages objectAtIndex:currentIndex-1];
    } else {
        return nil;
    }
}
-(void)buildUI
{
    // init pageControl
    pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = 4;
    pageControl.currentPage = 0;
    [pageControl setBounds:CGRectMake(0,0,16*(4-1)+16,16)]; //页面控件上的圆点间距基本在16左右。
    [pageControl.layer setCornerRadius:8]; // 圆角层
    [pageControl setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.2]];
    [self.view addSubview:pageControl];
    
    pageControl.frame=CGRectMake(50, 200, 40, 80);
    
    pageControl.currentPageIndicatorTintColor =MYColor(13, 109, 255);
    pageControl.pageIndicatorTintColor = MYColor(47, 47, 47);
    pageControl.backgroundColor = [UIColor clearColor];
    [self.pageControl setCurrentPage:0];
    
}

- (void)changePage:(id)sender {
    
    UIViewController *visibleViewController = self.pageController.viewControllers[0];
    NSUInteger currentIndex = [self.pages indexOfObject:visibleViewController];
    
    NSArray *viewControllers = [NSArray arrayWithObject:[self.pages objectAtIndex:self.pageControl.currentPage]];
    
    if (self.pageControl.currentPage > currentIndex) {
        [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    } else {
        [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
        
    }
}

@end
