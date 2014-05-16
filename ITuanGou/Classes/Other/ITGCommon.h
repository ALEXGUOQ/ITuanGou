// 1.固定的尺寸
// Dock上按钮的尺寸
#define ITGDockButtonW 100
#define ITGDockButtonH 80

// 2.判断是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

// 3.获得RGB颜色
#define ITGColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 4.自定义Log
#ifdef DEBUG
#define ITGLog(...) NSLog(__VA_ARGS__)
#else
#define ITGLog(...)
#endif
