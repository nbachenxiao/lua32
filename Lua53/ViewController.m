//
//  ViewController.m
//  Lua53
//
//  Created by admin on 2020/10/22.
//  Copyright © 2020 c0i. All rights reserved.
//

#import "ViewController.h"
#include "lua.hpp"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%s", LUA_VERSION);
    lua_State *L = luaL_newstate();  /* create state */
    luaL_openlibs(L);
    
    NSString *path = nil;
    path =  [[NSBundle mainBundle] pathForResource:@"main"
                                            ofType:@"luac"
                                       inDirectory:@"scripts"];
    if (!path) {
        path = [[NSBundle mainBundle] pathForResource:@"main"
                                               ofType:@"lua"
                                          inDirectory:@"scripts"];
    }
    
    luaL_dofile(L, [path UTF8String]);
}


@end
