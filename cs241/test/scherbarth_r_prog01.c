//ryanScherbarth
#include <stdio.h>
int main(){
printf("    *\n");
printf("   * *\n");
printf("  *   *\n");
printf(" *     *\n");
printf("*       *\n");
printf(" *     *\n");
printf("  *   *\n");
printf("   * *\n");
printf("    *\n");

char u, v, w; u = v = w = 'Z';
int x,y,z;    x = y = z = 42;

sscanf("12 3A 45 6B", "%c %d %c %d", &u, &x, &v, &y);
printf("%d,%d,%d,%c,%c,%c\n", x,y,z,u,v,w);

}
