const int b = 3;
const long c = 4;
long int d = 5;
int short e = 6;



void PruebaSinParametro(int a) {
    int a = 0;
    if (a + b > c && b - a < c) {
        return;
    }
}

int PruebaConParametro(int a) {
    return a;
}

int main() {
    long bigNum = 1.23E30L;
    short int a = 0;
    int b;

    b = a;
    switch (a) {
        case 'ab':
            break;
        case 'a':
            a = 5;
            break;
        case 'psd':
            a = 8;
            break;
        default:
            a = 20;
            break;
    }

    return;
}