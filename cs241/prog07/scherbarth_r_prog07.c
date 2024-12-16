#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

typedef struct node
{ // represents one node in a Binary Tree

  int data;           // data associated with this node
  struct node *left;  // pointer to left-child node in tree
  struct node *right; // pointer to right-child node in tree

} Node;

typedef struct
{

  Node *root; // pointer to the root node of the tree

} BinaryTree;

// function proto-types
void createTree(BinaryTree *someTree);
Node *initTree();
void toString(Node *someTree);
void preorder(Node *curr);
void postorder(Node *curr);
int size(Node *curr);
int height(Node *curr);
bool contains(Node *curr, int target);
bool isHeapOrdered(Node *curr);
int numSingleChild(Node *curr);
void makeMirror(Node *curr);

int main()
{

  BinaryTree *myTree = malloc(sizeof(BinaryTree));

  createTree(myTree); // initialize the fields of the list
  myTree->root = initTree();
  printf("the tree is:\n");
  toString(myTree->root);

  int treeSize = size(myTree->root);
  printf("\nthe tree has size = %d\n", treeSize);

  int treeHeight = height(myTree->root);
  printf("\nthe tree has height = %d\n", treeHeight);

  bool targetFound = contains(myTree->root, 21);
  printf("\nthe tree contains 21: %s\n",
         (targetFound ? "true" : "false"));

  bool isValidHeap = isHeapOrdered(myTree->root);
  printf("\nthe tree is heap ordered: %s\n",
         (isValidHeap ? "true" : "false"));

  int numSingle = numSingleChild(myTree->root);
  printf("\nnumber of nodes with 1 child is: %d\n", numSingle);

  makeMirror(myTree->root);
  printf("\nafter taking the mirror image, the tree is:\n");
  toString(myTree->root);
}

// Initially the Tree to be empty
void createTree(BinaryTree *someTree)
{
  someTree->root = NULL;
}

// create an initialize a tree Node with the given data
Node *initNode(int theData)
{
  Node *theNode;

  theNode = malloc(sizeof(Node));
  theNode->data = theData;
  theNode->left = NULL;
  theNode->right = NULL;

  return (theNode);
}

// return a pointer to the root node of a specific
// shape of binary parse tree
Node *initTree()
{
  Node *aLeaf, *bLeaf, *cLeaf, *dLeaf, *eLeaf;
  Node *fNode, *gNode, *hNode, *iNode, *jNode;
  Node *kNode, *lNode, *mNode;

  aLeaf = initNode(18);
  bLeaf = initNode(5);
  cLeaf = initNode(12);
  dLeaf = initNode(14);
  eLeaf = initNode(33);

  fNode = initNode(17);
  fNode->left = bLeaf;
  fNode->right = cLeaf;

  gNode = initNode(87);
  gNode->left = fNode;
  gNode->right = NULL;

  hNode = initNode(25);
  hNode->left = NULL;
  hNode->right = gNode;

  iNode = initNode(35);
  iNode->left = aLeaf;
  iNode->right = hNode;

  jNode = initNode(29);
  jNode->left = dLeaf;
  jNode->right = NULL;

  kNode = initNode(38);
  kNode->left = jNode;
  kNode->right = eLeaf;

  lNode = initNode(49);
  lNode->left = NULL;
  lNode->right = kNode;

  mNode = initNode(53);
  mNode->left = iNode;
  mNode->right = lNode;

  return (mNode); // return a pointer to root of the tree
}

// output the contents of the Tree
void toString(Node *root)
{
  preorder(root); // kick-start the recursion

  printf("\n");
}

// output the contents of the Tree in PREORDER
void preorder(Node *curr)
{
  if (curr == NULL)
  {

    return; // tree is empty
  }
  else
  {

    printf("%d ", curr->data);

    preorder(curr->left); // left subtree

    preorder(curr->right); // right subtree
  }
}

// output the contents of the Tree in POSTORDER
void postorder(Node *curr)
{
  if (curr == NULL)
  {

    return; // tree is empty, nothing to output
  }
  else
  {

    postorder(curr->left); // left subtree

    postorder(curr->right); // right subtree

    printf("%d ", curr->data);
  }
}

// return true if-and-only-if the subtree pointed to by
// the paramter curr is "heap-ordered", that is, the value in
// each node is less-than-or-equal-to its parent value
bool isHeapOrdered(Node *curr)
{
  return true; // dummy place-holder code
}

// return the number of nodes in the tree that have exactly
// one child
int numSingleChild(Node *curr)
{
  if (curr == NULL || (curr->left == NULL && curr->right == NULL))
  {
    return 0;
  }

  if (curr->left == NULL || curr->right == NULL)
  {
    return 1 + numSingleChild(curr->left) + numSingleChild(curr->right);
  }

  return numSingleChild(curr->left) + numSingleChild(curr->right);
}

// transform the subtree pointed to by curr to be
// its mirror-image, that is, the right child
// becomes the left child, and vice versa
void makeMirror(Node *curr)
{
  if (curr == NULL)
  {
    return; // empty tree
  }
  else
  {
    Node *temp;

    // swap
    temp = curr->left;
    curr->left = curr->right;
    curr->right = temp;

    // recursionnnnnnnnn
    makeMirror(curr->left);
    makeMirror(curr->right);
  }
}

// return the number of nodes in the subtree
int size(Node *curr)
{
  if (curr == NULL)
  {

    return 0; // tree is empty
  }
  else
  {

    int leftSize = size(curr->left); // left subtree

    int rightSize = size(curr->right); // right subtree

    return (leftSize + rightSize + 1);
  }
}

// return the height of the subtree pointed to by curr
int height(Node *curr)
{
  if (curr == NULL)
  {
    return 0;
  }

  if (curr->left == NULL && curr->right == NULL)
  {
    return 1;
  }

  int leftHeight = height(curr->left);
  int rightHeight = height(curr->right);

  return (1 + (leftHeight > rightHeight ? leftHeight : rightHeight));
}

// return true if-and-only-if the subtree below curr
// contains the given target
bool contains(Node *curr, int target)
{
  if (curr == NULL)

    return false; // tree is empty

  else if (curr->data == target)

    return true;

  else
  {

    bool leftSide = contains(curr->left, target); // left subtree

    if (leftSide)
      return true;

    bool rightSide = contains(curr->right, target); // right subtre

    return (rightSide);
  }
}
