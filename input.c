 // Eliminar para probar el parser

int main() {
    auto int a = 0;
    char b = 'c';
    read(b);
    const double pi = 3.14;
    enum { RED, GREEN, BLUE } color;
    extern int externalVar;
    float f = 1.23;
    for (int i = 0; i < 10; i++) {
        if (i % 2 == 0) {
            continue;
        } else {
            break;
        }
    }
    goto label;
    label:
    int x = sizeof(int);
    static int y = 10;
    struct Point {
        int x;
        int y;
    };
    switch (color) {
        case RED:
            return 0;
        case GREEN:
            return 1;
        case BLUE:
            return 2;
        default:
            return -1;
    }
    typedef unsigned long ulong;
    union Data {
        int i;
        float f;
        char str[20];
    };
    volatile int z = 0;
    while (z < 10) {
        z++;
    }
    return 0;
    int decimal = 42;
    int octal = 052; // 42 en octal
    int hexadecimal = 0X2A; // 42 en hexadecimal
    int binario = 0b101010; // 42 en binario (si se soporta)
    float f = 0.23; /*

    comments*/
    float pi = 3.14F;
    double e = 2.71828;
    long double bigNum = 1.23E30L;
    char c = '\n';
    string s = "\nHello, 
    World!";
    double e = .5;
    write(e);
}