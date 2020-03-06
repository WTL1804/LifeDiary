#import "SceneDelegate.h"
#import "DiscoveryViewController.h"
#import "GoodsViewController.h"
#import "LoginViewViewController.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
//    [userDefaults removeObjectForKey:@"userName"];
//    [userDefaults removeObjectForKey:@"passWord"];
//    [userDefaults synchronize];
   // NSString *string = [userDefaults objectForKey:@"userName"];
    if ([userDefaults objectForKey:@"userName"]) {
        GoodsViewController *goodViewController = [[GoodsViewController alloc] init];
        UINavigationController *goodsNav = [[UINavigationController alloc] initWithRootViewController:goodViewController];
        
        DiscoveryViewController *discoveryController = [[DiscoveryViewController alloc] init];
        UINavigationController *discoveryNav = [[UINavigationController alloc] initWithRootViewController:discoveryController];
        
        _tabBarController = [[UITabBarController alloc] init];
        NSArray *array = [NSArray arrayWithObjects:goodsNav, discoveryNav, nil];
        _tabBarController.viewControllers = array;
        
        goodsNav.title = @"物品";
        UIImage *tempImageOne = [[UIImage imageNamed:@"wupinguanli.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [goodsNav.tabBarItem  setImage:tempImageOne];
       
        
        discoveryNav.title = @"发现";
        UIImage *tempImageTwo = [[UIImage imageNamed:@"faxian.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [discoveryNav.tabBarItem setImage:tempImageTwo];
        self.window.rootViewController = _tabBarController;
    } else {
        LoginViewViewController *log = [[LoginViewViewController alloc] init];
        UINavigationController *navTemp = [[UINavigationController alloc] initWithRootViewController:log];
        
        self.window.rootViewController = navTemp;
    }
    
    [self.window makeKeyAndVisible];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
