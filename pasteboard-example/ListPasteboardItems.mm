#include <iostream>
#import <Foundation/Foundation.h>

void ReadPlist();

int main (int argc, const char* argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSLog(@"Hello world!");

    ReadPlist();

    NSString *urlString = [NSString stringWithFormat:@"http://heyhttp.org"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];

    NSURLSession *session = [NSURLSession sharedSession];
    NSData __block *responseData;
    BOOL __block requestCompleted = false;
    [[session dataTaskWithRequest:request completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error)
    {
        responseData = data;
        requestCompleted = true;
    }] resume];

    while (!requestCompleted)
    {
        [NSThread sleepForTimeInterval:0];
    }

    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];

    //std::cout << [responseString cStringUsingEncoding:NSUTF8StringEncoding];

    [pool drain];
    return 0;
}
