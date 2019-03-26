# Table Of Contents
+ String
+ Arrays
+ File
+ Binary Tree/Binary Search Tree
+ Void pointer
+ Function pointer
+ Quicksort
+ Binary search
+ Insertion sort
+ Bit
+ Misc. functions
+ Command Line Argument
+ Time
+ Memory: stack and heap

## STRING
> #include <string.h>

#### Input/Read to string
`ssize_t getline(char ** restrict linep, size_t * restrict linecapp, FILE * restrict stream);`

```c
char *line = NULL;
size_t linecap = 120; // max buffer
ssize_t linelen;
while ((linelen = getline(&line, &linecap, fp)) != -1)
    fwrite(line, linelen, 1, stdout);
free(line);
```
> Reads a line from stream, delimited by '\n' <br>
> '\n' is included as part of `line`, unless the end of the file is reached. <br>
> When modifying `line`, use a separate pointer to traverse line. Do not use `line` to traverse. <br>
> Remember to `free(line)` when done. <br>

`int getchar()`   
> Get 1 character from stdin <br>
```c
int char = getchar();`
putchar(char);
```

`int sprintf(char * str, const char * restrict format, ...);`
> Read from `...` to `str` according to `format` <br>

```c
char buffer[50];
int a = 10, b = 20, c = 30;
sprintf(buffer, "Sum of %d and %d is %d", a, b, c);
printf("%s", buffer);     // Sum of 10 and 20 is 30
```

`int sscanf(const char *restrict s, const char *restrict format, ...);`
> Reads its input from the character string pointed to by s, according to format and put inputs to variables in ...  <br>

```c
int num;
printf("Enter an integer: "); gets(line),
sscanf(line, "%d", &num),
```


#### Output/Display String content
`int puts(char *string)`  --> Write `string` to screen



#### Copy Strings
`char* stpcpy(char* dst, const char* src);`
`char* stpncpy(char* dst, const char* src, size_t len);`

```c
char* allocateString( char* inString ){
    char* outString;
    int   stringSize = strlen( inString ) + 1;

    outString = (char*) calloc (stringSize, sizeof (char));
    if ( outString == NULL)    EXIT_MEM;
    strcpy (outString, inString);
    return outString;
}
```

#### String length
`size_t strlen(const char* string);`  
> the number of characters that precede the terminating NUL character <br>

#### Searching in string
##### For 1 character
`char* strchr(char* string, int c);`
`char* strrchr(char* string, int c);`

##### For a substring
`char* strstr(char *string, char *substring);`

##### For first character in/not in a set
`size_t strspn(const char *s, const char *charset);`  -> not in charset
`size_t strcspn(const char *s, const char *charset);` -> in charset
`char* strpbrk(char* string, char* charset);` -> in charset

#### Parsing
`char* strtok(char* string, char* delim);`  
`double strtod (const char *s, char **endp);`

#### Converting Numeric Strings to Numbers
`long strtol(const char *restrict str, char **restrict endptr, int base);`   (example in book)

#### Lowercase/uppercase a string
```c
#include <ctype.h>
for (char* p = str; *p; ++p) *p = tolower(*p);
for (char* p = str; *p; ++p) *p = toupper(*p);
```
## ARRAYS

#### Passing the index of a column
```c
void printColumn(int table[][MAX_COLS],
  int theCol, int rows){
    int r;

    for( r = 0; r <  rows; r++ )
        printf( "%3d\n", table[r][theCol] );
    printf("\n");

    return;
}

```

##### Copy from array src to array dst
`void* memcpy(void* dst, const void* src, size_t n);`

```c
int a[10] = {10, 10, 10, 999, 999, 999, 999};
int c[10], d[10];

memcpy(c, a, 3 * sizeof (int)); // copy three 10 to c
memcpy(d, a + 3, 4 * sizeof(int)); // copy four 9999
```

## FILE

### Open and close
```c
#include <stdio.h>
#include <stdlib.h>
#define ERROR_OPEN    puts("Error opening file."); exit(101);
FILE* fp = fopen( "DATA.TXT", "r");
if ( !fp ) ERROR_OPEN

// Code to process file
if ( fclose( fp) == EOF ){
    printf ("Error closing!");
    exit(201);
}
```


```c
int main(){
  FILE* fp1, *fp2;
  file_open(&fp1, &fp2);
  process(&fp);

}
void file_open(FILE** fp1, FILE** fp2);
void process(FILE** fp);  
```

"r"  - read text data
"w"  - write text data. Overwrite file if file exists
"a"  - append text.
"rb" - read binary data
"wb" - write binary data
"ab" - append binary data to existing binary file
"r+b" – read and write an existing binary file. Doesn't create a new file
"w+b" – read and write a new binary file. Create a new file if it does't exist. Overwrite existing file
"a+b" – read and append binary data to existing binary file

### Process
#### Read from file
> #define FLUSH while( getchar() != '\n' ) <br>

`int fscanf(FILE *restrict stream, const char *restrict format, ...);`
> scan from *stream* according to *format* into char* in ...
> scan stops when an input character does not match such a format character.
> return the number of character successfully read and store in `stream`, -1 for reach EOF.


```c
fscanf (stdin, "%d %f", &year, &price);   // example 1
fscanf(fpDates, "%d%*c%d%*c%d", &year, &month, &day); // %*c discard 1 char (/,-, etc)
while (fscanf(fpIn, "%c %d %d%*c", &op, &n1, &n2) != EOF )
{ ... ; FLUSH; }     // *c to discard '\n'   // example 2


```

`char fgets(char *string, int numchars, FILE *fp);`
> `numchars` can be `sizeof(string)` <br>
> Read from `fp` and stops after `numchars - 1` characters are read. Retains '\n' and '\0' is put after it <br>
> Doesn't do any malloc() so pass `char s[35]` as argument <br>
> Return a pointer to the `string`.  If EOF occurs, return NULL <br>

`ssize_t getline(char** restrict linep, size_t * restrict linecapp,FILE * restrict stream);`
`int fgetc(FILE* fp)`   -> read 1 character

`size_t fread(void* restrict ptr, size_t size, size_t nitems, FILE* restrict stream);`
> reads `nitems` **objects** (array, struct, ...), each **objects** is `size` bytes long, from `stream`, storing them at the location given by `ptr`. <br>
> **`ptr` is a pointer** <br>
> `size` is sizeof() each **object** <br>



#### Write to file
`int fprintf(FILE * restrict stream, const char * restrict format, ...);`
> Produces output to stream according to `format` and variables in ... <br>
> Return the number of characters printed (not including the trailing '\0') <br>

`int fputc(int c, FILE* fp)`
> write 1 character `c` to file <br>

`int fputs(char* string, FILE* fp)`  
> Write `string` to a file. <br>
> Doesn't append '\n' to the end of string <br>

`size_t fwrite(const void *restrict ptr, size_t size, size_t nitems, FILE *restrict stream);`

> Writes `nitems` objects, each `size` bytes long, to the `stream`, obtaining them from the location given by `ptr`. <br>
> Can be used to write to both binary and non-binary file (e.g.: .txt file). But, will write binary to non-binary file <br>
> Return 0 if read unsuccessfully, otherwise, return the number of items written. <br>
> Use `sizeof()`, size of each object, for `size` parameter <br>

#### Misc.
`int fseek(FILE *fp, long offset, int from);`
> Set the file position, crucial for fread() and fwrite() <br>
> SEEK_SET - beginning, SEEK_END - end, SEEK_CUR - current <br>

```c
int main() {
   int i[] = {1, 2, 3, 4, 5}, j[5], k;
   FILE* fp = fopen("out.txt", "w+b");
   fwrite(i, sizeof(int), 5, fp); // write an array of 5 int to out.txt
   rewind(fp);

   fseek(fp,  2 * sizeof (int), SEEK_SET); // points to 3
   fread(&k, sizeof(int), 1, fp);
   printf("%d\n", k);                      // 3
   fseek(fp, -1 * sizeof(int), SEEK_CUR);

   fseek(fp,  2 * sizeof (int), SEEK_CUR); // points to 5
   fseek(fp, -3 * sizeof (int), SEEK_CUR); // points to 2
   fseek(fp, -1 * sizeof (int), SEEK_END); // points to 5

   // append one item to file
   int item = 6;
   fseek(fp, 0, SEEK_END);
   fwrite(&item, sizeof(int), 1, fp);

   // calculate the number of records in the file
   fseek(fp, 0, SEEK_END);
   long pos = ftell(fp);
   printf("\nThere are %ld records in this file.\n", pos/sizeof(RECORD) );

   fclose(fp);
```

`void rewind(FILE* fp);`  
> Move the file pointer to the first byte <br>

`long ftell(FILE* fp);`
> Return how many bytes from the beginning of the file <br>

`char *tmpnam(char *filename);`
> Create a file name that will not conflict with any  other file name on your system

```c
char filename[L_tmpnam];    // L_tmpnam defined in stdio.h
if (tmpnam(filename) == NULL){
    printf("Could not get non-conflicting  filename.\n");
    exit(1);
}
printf("\nFilename obtained is: %s\n\n", filename);
```

`int rename(const char *oldFilename, const char *newFilename);`
> Rename file from `oldFilename` to `newFilename`. <br>
> Return 0 if renaming is successful. <br>

`int remove(const char *fileName);`
> Delete a file. Return 0 if success <br>

## Binary Tree/Binary Search Tree
***Leaf*** - node with no child/successor.
***Breadth-first traversal*** - start at root, then traverse left to right of each level.
***Depth-first traversal***:




***Binary Search Tree*** - All items in the left sub-tree are  less than the root. All items in the right sub-tree are greater than or equal to the root. Each sub-tree is itself a binary search tree.

#### Traversal
***In-order traversal*** - Left-Root-Right
```c
void inorder(NODE* root){
      if (root){
        inorder(root->left);
        printf("%d   ",root->data);
        inorder(root->right);
     }
     return;
}
```
***Pre-order traversal*** - Root-Left-Right
```c
void preorder(NODE* root){
    if (!root) return;   
    printf("%s ", root->data);
    preorder(root->left);
    preorder(root->right);
}
```
***Post-order traversal*** - Left-Right-Root
```c
void postorder(struct node* node){
     if (!node) return;
     postorder(node->left);
     postorder(node->right);
     printf("%d ", node->data);
}
```

#### Search data in BST
```c
TREE_NODE* find(char *word, TREE_NODE* tree){
    int compare;
    if (!tree) return NULL;
    compare = strcmp(word, tree->word);
    if (compare < 0)
        return find(word, tree->left);
    else if (compare > 0)
        return find(word, tree->right);
    else
        return (tree);  //found
}
```

#### Insert data (of type int) to BST
```java
int insert( NODE **root, int data )
{
   if(!(*root)){ // parent found: insert data
      // allocate the new node
      if( !(*root = (NODE *) malloc (sizeof(NODE))) )
         printf( "Fatal malloc error!\n" ), exit(1);
      (*root)->data  = data;
      (*root)->left  = (*root)->right = NULL;
      return 1; // data inserted
   }

   // search
   if (data > (*root)->data)
      return insert(&(*root)->right, data);
   else if (data < (*root)->data)
      return insert(&(*root)->left, data);
   else{
       printf("Node already in the tree!\n");
       return 0; // duplicate
   }
 }
```

#### Delete node by data
```c
struct Node* Delete(struct Node *root, int data) {
  if (root == NULL)    return NULL;

  if (data < root->data) {  // data is in the left sub tree.
      root->left = Delete(root->left, data);
  } else if (data > root->data) { // data is in the right sub tree.
      root->right = Delete(root->right, data);
  } else {
     // case 1: no children
     if (root->left == NULL && root->right == NULL) {
        delete(root); // wipe out the memory, in C, use free function
        root = NULL;
     }
     // case 2: one child (right)
     else if (root->left == NULL) {
        struct Node* temp = root; // save current node as a backup
        root = root->right;
        delete temp;
     }
     // case 3: one child (left)
     else if (root->right == NULL) {
        struct Node* temp = root; // save current node as a backup
        root = root->left;
        delete temp;
     }
     // case 4: two children
     else {
        struct Node* temp = FindMin(root->right); // find minimal value of right sub tree
        root->data = temp->data; // duplicate the node
        root->right = Delete(root->right, temp->data); // delete the duplicate node
     }
  }
  return root; // parent node can update reference
}

// Find smallest node of root
Node *FindMin(node *root) {
  node* temp = root;
  while (temp->left != NULL)
    temp = temp->left;
  return temp;
}

```

#### Delete leaves  
```c
NODE* DeletePostorder(struct node* node){
    if (!node) return NULL;
    if (!node->left && !node->right) return NULL;

    node->left = DeletePostorder(node->left);
    node->right = DeletePostorder(node->right);
    return node;
}
```


#### Count node
```c
int countB(NODE *root){
    if (!root) return 0;
    return 1 + countB(root->left) + countB(root->right);
}
```

## Void Pointer
The void pointer can be used with any pointer, and any pointer can be assigned to a void pointer.

It may NOT be de-referenced!

## Function Pointer
Example:
```c
void printHash( const char *name,
      unsigned int (*hash)(const char *, int) );

// functions
unsigned int RSHash (const char *key, int size);
unsigned int DEKHash(const char *key, int size);
unsigned int DJBHash(const char *key, int size);

// passing function as parameter
printHash( "RSHash",  RSHash );
printHash( "DEKHash", DEKHash );
printHash( "DJBHash", DJBHash );

/***********************************************/
void printHash(const char *name,
      unsigned int (*hash)(const char *key, int size) )
{
    char key[] = "CIS 26B: Advanced C";
    printf("%-12s: %u\n", name, hash(key, SIZE));    
    return;
}
```
#### An Array of Pointers to Functions
```c
unsigned int RSHash (const char *key, int size);
unsigned int DEKHash(const char *key, int size);
unsigned int DJBHash(const char *key, int size);

// array of pointers to functions
unsigned int (*hashList[4])(const char* , int) =
        {RSHash, DEKHash, DJBHash, NULL};

// pointer to traverse the array of function pointers
unsigned int (**mover)(const char* key, int size);
mover = hashList;
```

#### Return a Pointer to a Function from a function
```c
unsigned int
(*selectHash(int n,
unsigned int (*hashList[])(const char *,int)))(const char *, int){
    return hashList[rand() % n];
}

unsigned int (*hash)(const char *, int);
hash = selectHash(3, hashList);

// to simply the declaration of selectHash() above
// use typedef
typedef unsigned int HASHFNCT(const char *, int);
HASHFNCT *selectHash(int n, HASHFNCT *hashList[]){
    return hashList[rand() % n];
}
```

#### A Pointer to a Function as a Field in a Structure
```c
typedef struct {
    char *name;
    unsigned int (*hash)(const char *key, int size);
} HASH;

HASH hashList[] = {
{"RSHash",  RSHash}, {"DEKHash", DEKHash}, {"DJBHash", DJBHash}, {NULL, NULL}
};

```

## Functions with Variable-Length Argument List
> #include <stdarg.h>

```c
// prototype
double sumargs(int n, . . .);      
// calls
sum = sumargs(3, 10.0, 20.0, 30.0);   
sum = sumargs(2, 10.0. 20.0);
sum = sumargs(0);
sum = sumargs(3, 10, 'A', 3.3); 			// Incorrect! All of them must be double
sum = sumargs(3, (double)10, 3.3, (double)'A'); 	// Correct!
```

#### Initializes a pointer to point to the first unnamed argument
```c
// prototype
double sumargs(int n, . . .);     
// call
sum = sumargs(3, 10.0, 20.0, 30.0);     
// Initializes a pointer to point to the first unnamed argument
va_list argp; 		
va_start(argp, n);  
// argp is a local state variable used to traverse the parameters, argp should NEVER be de-referenced!
// n is the name of the last parameter before the variable argument list, i.e., the last parameter of which the calling function  knows the type.
double num = va_arg(argp, double);
// get the current argument
// move argp to the next unnamed argument
va_end(argp);              // clean up
```



## QUICKSORT

PSUEDOCODE (always choose last element as pivot)
```
/* low  --> Starting index of array,  high  --> Ending index */
quickSort(arr[], low, high){
    if (low < high)  {
        pi = partition(arr, low, high);  	   /* pi is partitioning index, arr[pi] is now  at right place */
        quickSort(arr, low, pi - 1);  // Before pi
        quickSort(arr, pi + 1, high); // After pi
    }
}

PSEUDO CODE FOR PARTITION()
/* This function takes last element as pivot, place the pivot element at its correct position in sorted
    array, and places all smaller (smaller than pivot) to left of pivot and all greater elements to right
   of pivot */
partition (arr[], low, high) {

    pivot = arr[high];			    // pivot (Element to be placed at right position)

    i = (low - 1)  // Index of smaller element

    for (j = low; j <= high- 1; j++) {
        if (arr[j] <= pivot) {
            i++;    					// increment index of smaller element
            swap arr[i] and arr[j]
        }
    }
    swap arr[i + 1] and arr[high])
    return (i + 1)
}
```
#### Ways to improve the algorithm
1. Use insertion sort when a partition becomes small.

##### C's Quick Sort:
```c
void qsort(void *start_address,size_t num_elements, size_t element_size,
int (*compare)(const void *key, const void* current_element);  
```
> Sort an array of num_elements objects, the initial member of which is pointed to by start_address. The size of each object is specified by element_size. <br>


Example:
```c
typedef struct {
    char partname[20];
    int quantity;
}HARDWARE;

HARDWARE inventory[numparts] = {{"A", 10}, {"B", 2}, {"C", 1}};

qsort(inventory, numparts, sizeof(HARDWARE), compare);

int compare(const void *part1, const void *part2){
  const HARDWARE *p1 = part1, *p2 = part2;

  int cmpres = strcmp(p1->partname, p2->partname)

  if (cmpres > 0) return 1;
  else if (cmpres < 0) return -1;
  else return 0;
}
```

## Binary Search
##### Condition: List must be sorted
PSEDOCODE
```c
// list MUST BE SORTED!
// list must contain at least one element, size is the number of elements in list, target is the value of element being sought.
// If found: return 1; locn assigned index to target element.
// If not found: return 0; locn assigned index of element above target

int binarySearch (int list[], int size, int target, int *locn){
  int first = 0, mid, last = size - 1;

  while (first <= last) {
    mid = (first + last) / 2;
    if (target > list[mid]) 	// look in upper half
       first = mid + 1;
    else if (target < list[mid]) // look in lower half
       last = mid - 1;
    else // target found: force exit
       first = last + 1;
  } // end while
  *locn = mid;
  return target == list [mid];
}

```
Example of C's general binary search function:
```c
#include <stdlib.h>
void *bsearch(void *key, const void *start_address, size_t num_elements, size_t element_size, int (*compare)(const void *key, const void *current_element);

HARDWARE temp;
found = (HARDWARE *)bsearch(&temp, inventory, numparts, sizeof (HARDWARE), compare);

int compare(const void* part1, const void* part2){
    const HARDWARE* p1 = part1, * p2 = part2;

    if (strcmp(p1->partname, p2->partname) > 0) return 1;
    else if (strcmp(p1->partname, p2->partname) < 0) return -1;
    else return 0;
}
```

## INSERTION SORT
Example:
```c
void insertionSort (CIS_CLASSES  list[], CIS_CLASSES *pLast)
{
	CIS_CLASSES  temp;
	CIS_CLASSES *pCurr;
	CIS_CLASSES *pWalk;

	for (pCurr = list + 1; pCurr <= pLast; pCurr++)
    {
	   temp    = *pCurr;
	   pWalk = pCurr - 1;
       while (pWalk >= list && strcmp(temp.course, pWalk->course) < 0)
       {
             *(pWalk + 1) = *pWalk;
	          pWalk--;
	   }
	   *(pWalk + 1)  = temp;
    }

}
```

## Signal and Error-handling
***Signal*** - exceptional condition:
+ run-time errors (such as division by 0) + events caused outside the program (such as interrupting or terminating a running program)

***Signal Macros***

| Macro of signals     | Meaning         |
| --------------| -------------- |
|SIGABRT|	Abnormal termination (abort())|
|SIGINT		| Interrupt (CTRL-C on most machines)|
|SIGSEGV|	Invalid storage access (dereference an invalid address)|
|SIGFPE	|	Floating-point overflow or underflow|
|SIGTERM|	Termination request, often from another program.|

| Macro of handler     | Meaning         |
| --------------| -------------- |
|SIG_DFL	|	Handles signals in a “default” way. Usually this will terminate the program|
|SIG_IGN |		Ignore the signal if it should be raised later |
|func_name	| A function (any name) |

#### Installs a signal-handling function for use later
```c

void (*signal(int  signal_code,
              void (*handler)(int signal_code)))(int);

// signal_code, the code for a certain signal
// a pointer to a function that will handle the signal if it’s raised later in the program

// FUNCTION CALL WITH macro signal and macro handler
signal(SIGINT,  SIG_IGN);
signal(SIGFPE,  SIF_DFL);
signal(SIGSEGV, myHandler);


```
Example:

```c
// FUNCTION CALL with macro signal and handwritten handler()
float i = 10, j = 0, res;
char *ptr;

signal(SIGINT,  handler);
signal(SIGFPE,  handler);
signal(SIGSEGV, handler);

if (j == 0)
    raise(SIGFPE);
else
{
    res = i / j;
    printf("%f\n", res);
}
printf("%c\n", *ptr);


void handler(int signum)
{
    switch (signum)
    {
    case SIGINT:  
       printf("SIGINT caught!\n");
       signal(SIGINT, handler);
       break;
    case SIGSEGV:
       printf("SIGSEGV caught!\n");
       printf("End of Program!\n");
       getchar();
       exit(1);
       break;
    case SIGFPE:  
       printf("SIGFPE caught!\n");
       signal(SIGFPE, handler);
       break;
    }
    return;
}
```

## JUMP: Controlled Re-entry to Code
> #include<setjmp.h>

***setjmp*** - is a macro, “marks” a place in the program (the target of a future jump)  
***longjmp***	-	function: to return to the placed “marked” by setjmp`


## Bit
#### To print bit
```c
void printBinary(unsigned short a){
    for(int i = 15; i >= 0; i--)
        printf("%hu", (a >> i) & 1);
}
```
## Misc. Functions
**Give a random number between 0 and max**:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`int num = rand() % max;`

**Macros:**
```c
#define ASSERT_GENERAL(exp, msg, exe) \
if (!(exp)) {                         \
    printf(msg);                      \
    exe;                              \
}


#define ASSERT_RETURN(exp, msg, status) ASSERT_GENERAL(exp, msg, return status)
#define ASSERT_EXIT(exp, msg, status)   ASSERT_GENERAL(exp, msg, exit(status))
#define ASSERT_BREAK(exp, msg)          ASSERT_GENERAL(exp, msg, break)
#define ASSERT_CONTINUE(exp, msg)       ASSERT_GENERAL(exp, msg, continue)
```

**Remove whitespace from string and convert uppercase letters to lowercase.**
```c
void format(char* s) {
    char* fast = s, * slow = s;

    while (*fast){
        if (!isspace(*fast))  *slow++ = tolower(* fast);
        fast++;
    }
    *slow = '\0';
}
```

## Command Line Argument
```c
int main( int argc, char* argv[])
{          // argc - count;
           // argv – vector
    int i;’
    char** mover;

    for (i = 0; i < argc; i++)
    {
        printf("Argument %d is %s\n", i, argv[i]);
    }
    printf("\n");
    for (mover = argv; *mover != NULL; mover++)
    {
        printf("Argument pointed at by mover is %s\n", * mover);
    }
    return 0;
}
```

## Time
> #include <time.h>

Time could be stored in three different ways:

***clock_t***	: time value measured in “clock ticks” (duration)

***time_t***	: calendar time (compact, encoded time and date)
`time_t time (time_t *timeptr)`
```c
time_t timeval;     
time(&timeval);           // seconds since 1/1/70
printf("%ld\n", timeval);
```

***struct tm***: broken-down time (seconds, minutes, hours, …)
 + tm_sec		Seconds after the current minute	0 to 59
 + tm_min		Minutes after the current hour	0 to 59
 + tm_hour	Current hour (military time)	0 to 23
 + tm_mday	Day of the current month		0 to 30
 + tm_wday	Days since the most recent Sunday	0 to 6
 + tm_yday	Days since January 1			0 to 365
 + tm_mon		Months since January			0 to 11
 + tm_year	Years since 1900		Current year - 1900

`struct tm *localtime (time_t *timeptr)`
```c
time_t     timeval;  // time
struct tm *timeptr;  // localtime  
timeptr = localtime(&timeval);  //
```

#### Converting Time object to String
`char *asctime(struct tm *timeptr);`
```c
time_t     timeval;  // time
struct tm* timeptr;  // localtime
char*      chtime;   // asctime  

time(&timeval);
timeptr = localtime(&timeval);
chtime  = asctime(timeptr);   // // Mon May 30 22:54:00 2011
```

`char *ctime(time_t *timeptr)`
```c
// same as asctime but simpler to use
time_t  timeval;  // time
char   *chtime;   // ctime  
time(&timeval);
chtime  = ctime(&timeval);  // Mon May 30 22:54:00 2011
```

#### Find the difference between two times in seconds
`double difftime(time_t time1, time_t time2);`  
```c
// seconds only!!
ftime = difftime(time2, time1);
printf("%f seconds\n", ftime);  
```

```c
// Difference between 2 times in hours, mins, secs
time_t time1, time2, diff;
time(&time1);
term = fibonacci(40);
time(&time2);

diff = time2 - time1;
tptr = gmtime(&diff);
printf("%d seconds\n" tptr->tm_sec); // hours, minutes, seconds
```

#### String formatted string
`size_t strftime(char* string, size_t string_size, char *format, struct tm *timeptr);`
>Converts a time structure into a string
Returns the number of characters stored in string
Returns 0 if an error occurred
More flexible than asctime, or ctime, similar to sprintf  <br>

```c
struct tm *timeptr;
time_t timeval;
char buffer[80];

time(&timeval);
timeptr = localtime(&timeval);

strftime(buffer, sizeof(buffer), "%A, %b %d %I:%M %p %Y\n", timeptr);
// Tuesday, May 31 10:24 AM 2011

```

## Memory: Stack and Heap

A stack-frame contains four different elements:
Parameters, Local variables, Return value (if any) and Where it should return when its processing is done.

## cdecl
Neat program in command line to translate C code to human language
