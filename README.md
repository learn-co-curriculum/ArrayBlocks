

#ArrayBlocks

## Instructions

Apple has provided us with some great functionality in the `NSArray` class that we haven't touched yet. For example, the method `enumerateObjectsUsingBlock:` lets us loop over the elements in an array with fewer lines of code. Similarly, Apple provides us some advanced functionality for filtering collections such as `NSArray` with its `predicateUsingBlock:` method.

Let's take a look at an example of each of these.

######Example
```objc
[testArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
	NSLog(@"%@",@([(NSNumber *)obj integerValue] + 1));
}];
```

Here we've made a call to `enumerateObjectsUsingBlock` that will print each value in our `NSArray` with one added to it. (Be careful: This block does not consider the possibility that your array contains objects that do not respond to the method `integerValue`!)

######Example
```objc
[NSPredicate *evenPredicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings){
        return [evaluatedObject integerValue] % 2 == 0;
    }];
    
NSArray *filteredResultsArrayTwo = [resultsArray filteredArrayUsingPredicate:evenPredicate];
```

Here we have created a predicate that will return only even numbers of our array. As above, be careful; this block does not consider the possibility that your array contains objects that do not respond to the method `integerValue`! 

**Now it's your turn**: Try writing your own methods that take blocks of code to mimic the capabilities of these two functions for `NSArray` objects. Your methods should extend the NSArray class (via a category) and will be called `mapWithBlock:` (our form of `enumerateObjectsUsingBlock:`) and `selectWithBlock:` (our form of `filteredArrayUsingPredicate:` + `predicateUsingBlock:`). The arguments should be the blocks.

Some additional notes:

1) For our equivalent of `enumerateObjectsUsingBlock` do not concern yourself with adding in the `BOOL *` argument for the basic version.

2) `selectWithBlock:` should be built as an instance method, and should take the predictate block directly, rather than an `NSPredicate`.

Go!


##Advanced

Now add in the `BOOL *` argument for `mapWithBlock:`. Note: This will not further your understanding of blocks, but it will teach you a little bit more about memory addresses.

Further reading for ```BOOL *```:  
<a href="http://www.drdobbs.com/mobile/pointers-in-objective-c/225700236?pgno=1">
Blog post</a>  
<a href="http://stackoverflow.com/questions/6546214/when-we-need-pointer-of-bool-variable-in-objective-c/6546351#6546351">
Stack overflow post</a>    





