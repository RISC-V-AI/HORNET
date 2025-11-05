//#include <stdio.h>
#include "params.h"
//#include "../randombytes.h"
#include "poly.h"
#include "params.h"
#include "sign.h"
#include "packing.h"
#include "polyvec.h"
#include "poly.h"
#include "symmetric.h"
#include "fips202.h"
#include "config.h"
//#include <stdint.h>
//#include "../../libs/soc/platform.h"
//#include "../../libs/soc/uart.h"

#define GPIO_BASE 0x00008010

#define	NTESTS 1

static volatile uint32_t* SW        = (uint32_t*)0x10000000;
static volatile uint32_t* LEDRGB    = (uint32_t*)0x10001000;
static volatile uint32_t* LED       = (uint32_t*)0x10002000;
static volatile uint32_t* BTN       = (uint32_t*)0x10003000;
static volatile uint32_t* MTIME     = (uint32_t*)0x10004000;
static volatile uint32_t* MTIMEH    = (uint32_t*)0x10004004;
static volatile uint32_t* MTIMECMP  = (uint32_t*)0x10004008;
static volatile uint32_t* MTIMECMPH = (uint32_t*)0x1000400c;



//static struct uart uart0;
/*
 s *tatic void poly_naivemul(poly *c, const poly *a, const poly *b) {
 unsigned int i,j;
 int32_t r[2*N] = {0};

 for(i = 0; i < N; i++)
   for(j = 0; j < N; j++)
     r[i+j] = (r[i+j] + (int64_t)a->coeffs[i]*b->coeffs[j]) % Q;

   for(i = N; i < 2*N; i++)
     r[i-N] = (r[i-N] - r[i]) % Q;

   for(i = 0; i < N; i++)
     c->coeffs[i] = r[i];
   }*/
/*
 i *nt main(void) {

 unsigned int i, j;
 uint8_t seed[SEEDBYTES];
 uint16_t nonce = 0;
 poly a, b, c, d;

 randombytes(seed, sizeof(seed));
 for(i = 0; i < NTESTS; ++i) {
   poly_uniform(&a, seed, nonce++);
   poly_uniform(&b, seed, nonce++);

   c = a;
   poly_ntt(&c);
   for(j = 0; j < N; ++j)
     c.coeffs[j] = (int64_t)c.coeffs[j]*-114592 % Q;
   poly_invntt_tomont(&c);
   for(j = 0; j < N; ++j) {
     if((c.coeffs[j] - a.coeffs[j]) % Q)
       fprintf(stderr, "ERROR in ntt/invntt: c[%d] = %d != %d\n",
       j, c.coeffs[j]%Q, a.coeffs[j]);
     }

     poly_naivemul(&c, &a, &b);
     poly_ntt(&a);
     poly_ntt(&b);
     poly_pointwise_montgomery(&d, &a, &b);
     poly_invntt_tomont(&d);

     for(j = 0; j < N; ++j) {
       if((d.coeffs[j] - c.coeffs[j]) % Q)
         fprintf(stderr, "ERROR in multiplication: d[%d] = %d != %d\n",
         j, d.coeffs[j], c.coeffs[j]);
       }
       }

       return 0;
       }
       */

/*
 i *nt main(int argc, char **argv) {

 unsigned int i, j;
 volatile int *addr = (int *) GPIO_BASE;
 poly a, b, d;


 *addr = 10;
 for(i = 0; i < NTESTS; ++i) {
   for(j = 0; j < N; ++j) {
     a.coeffs[j] = 0;
     b.coeffs[j] = 0;
     }
     *addr = 11;
     a.coeffs[0] = 12;
     b.coeffs[0] = 15;
     *addr = 12;
     poly_ntt(&a);
     poly_ntt(&b);
     *addr = 13;
     poly_pointwise_montgomery(&d, &a, &b);
     *addr = 14;
     poly_invntt_tomont(&d);


     volatile int dummy = d.coeffs[0];

     *addr = 5;
     }
     return 0;
     }*/
/*
 i *nt main(void) {

 uart_init(&uart0, (volatile void *) PLATFORM_UART_BASE);
 uart_set_baudrate(&uart0, 115200, PLATFORM_CLK_FREQ);


 char buffer[65] = {0};
 uart_rx_line(&uart0, buffer);

 unsigned int i, j;
 //uint8_t seed[SEEDBYTES];
 //uint16_t nonce = 0;
 volatile int *addr = (int *) GPIO_BASE;
 poly a, b, d;

 //randombytes(seed, sizeof(seed));
 for(i = 0; i < NTESTS; ++i) {
   //poly_uniform(&a, seed, nonce++);
   //poly_uniform(&b, seed, nonce++);
   for(j = 0; j < N; ++j) {
     a.coeffs[j] = 0;
     b.coeffs[j] = 0;
     }
     // Sadece ilk katsayıları ata
     a.coeffs[0] = 12;
     b.coeffs[0] = 15;
     //c = a;
     //poly_ntt(&c);
     //for(j = 0; j < N; ++j)
     //  c.coeffs[j] = (int64_t)c.coeffs[j]*-114592 % Q;
     //poly_invntt_tomont(&c);
     //for(j = 0; j < N; ++j) {
     //  if((c.coeffs[j] - a.coeffs[j]) % Q)
     //    fprintf(stderr, "ERROR in ntt/invntt: c[%d] = %d != %d\n",
     //            j, c.coeffs[j]%Q, a.coeffs[j]);
     //}

     //poly_naivemul(&c, &a, &b);
     poly_ntt(&a);
     poly_ntt(&b);
     poly_pointwise_montgomery(&d, &a, &b);
     poly_invntt_tomont(&d);


     volatile int dummy = d.coeffs[0];

     *addr = dummy;


     //uart_printf(&uart0, "Hello World!\r\n");
     //uart_putchar(&uart0,dummy);
     }
     //uart_printf(&uart0, "Hello World!\r\n");
     uart_tx_string(&uart0, buffer);
     return 0;
     }*/

/*
 i *nt main() {
 uint8_t pk[1312] = {0};
 uint8_t sk[2560] = {0};
 volatile int *addr = (int *) GPIO_BASE;
 uint8_t seedbuf[3*SEEDBYTES] = {0};
 uint8_t tr[CRHBYTES];
 const uint8_t *rho, *rhoprime, *key;

 polyvecl mat[K];
 polyvecl s1, s1hat;
 polyveck s2, t1, t0;

 //randombytes(seedbuf, SEEDBYTES);


 shake256(seedbuf, 3*SEEDBYTES, seedbuf, SEEDBYTES);
 rho = seedbuf;
 rhoprime = seedbuf + SEEDBYTES;
 key = seedbuf + 2*SEEDBYTES;

 // Expand matrix
 polyvec_matrix_expand(mat, rho);

 // Sample short vectors s1 and s2
 polyvecl_uniform_eta(&s1, rhoprime, 0);
 polyveck_uniform_eta(&s2, rhoprime, L);

 // Matrix-vector multiplication
 s1hat = s1;
 polyvecl_ntt(&s1hat);
 polyvec_matrix_pointwise_montgomery(&t1, mat, &s1hat);
 polyveck_reduce(&t1);
 polyveck_invntt_tomont(&t1);

 // Add error vector s2
 polyveck_add(&t1, &t1, &s2);

 // Extract t1 and write public key
 polyveck_caddq(&t1);
 polyveck_power2round(&t1, &t0, &t1);
 pack_pk(pk, rho, &t1);

 // Compute CRH(rho, t1) and write secret key
 crh(tr, pk, CRYPTO_PUBLICKEYBYTES);
 pack_sk(sk, rho, tr, key, &t0, &s1, &s2);

 //printf("%d \n  %d",*sk,*pk);
 *addr = *sk;

 uart_init(&uart0, (volatile void *) PLATFORM_UART_BASE);
 uart_set_baudrate(&uart0, 115200, PLATFORM_CLK_FREQ);
 uart_printf(&uart0, "Hello World!\r\n");

 return 0;
 }
 */
#define MLEN 59
#define NTESTS 1

int main(void)
{
  volatile uint8_t *addr = (uint8_t *) GPIO_BASE;
  unsigned int i, j;
  int ret;
  size_t mlen, smlen;
  uint8_t m[MLEN] = {0};
  uint8_t sm[MLEN + CRYPTO_BYTES];
  uint8_t m2[MLEN + CRYPTO_BYTES];
  uint8_t pk[CRYPTO_PUBLICKEYBYTES];
  uint8_t sk[CRYPTO_SECRETKEYBYTES]= {0};;
  *addr = 12;
  for(i = 0; i < NTESTS; ++i) {
    crypto_sign(sm, &smlen, m, MLEN, sk);
    for (j = 0; j < smlen; j++) {
      *addr = sm[j];   // her byte’ı sırayla yaz
    }

  }

  return 0;
}
