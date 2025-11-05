/*static const uint64_t KeccakF_RoundConstants[NROUNDS] = {
  (uint64_t)0x0000000000000001ULL,
  (uint64_t)0x0000000000008082ULL,
  (uint64_t)0x800000000000808aULL,
  (uint64_t)0x8000000080008000ULL,
  (uint64_t)0x000000000000808bULL,
  (uint64_t)0x0000000080000001ULL,
  (uint64_t)0x8000000080008081ULL,
  (uint64_t)0x8000000000008009ULL,
  (uint64_t)0x000000000000008aULL,
  (uint64_t)0x0000000000000088ULL,
  (uint64_t)0x0000000080008009ULL,
  (uint64_t)0x000000008000000aULL,
  (uint64_t)0x000000008000808bULL,
  (uint64_t)0x800000000000008bULL,
  (uint64_t)0x8000000000008089ULL,
  (uint64_t)0x8000000000008003ULL,
  (uint64_t)0x8000000000008002ULL,
  (uint64_t)0x8000000000000080ULL,
  (uint64_t)0x000000000000800aULL,
  (uint64_t)0x800000008000000aULL,
  (uint64_t)0x8000000080008081ULL,
  (uint64_t)0x8000000000008080ULL,
  (uint64_t)0x0000000080000001ULL,
  (uint64_t)0x8000000080008008ULL
};*/
/*
static void KeccakF1600_StatePermute(uint64_t state[25])
{
        int round;
          volatile uint8_t *addr = (uint8_t *) GPIO_BASE; 
        *addr = 77;
        uint64_t Aba, Abe, Abi, Abo, Abu;
        uint64_t Aga, Age, Agi, Ago, Agu;
        uint64_t Aka, Ake, Aki, Ako, Aku;
        uint64_t Ama, Ame, Ami, Amo, Amu;
        uint64_t Asa, Ase, Asi, Aso, Asu;
        uint64_t BCa, BCe, BCi, BCo, BCu;
        uint64_t Da, De, Di, Do, Du;
        uint64_t Eba, Ebe, Ebi, Ebo, Ebu;
        uint64_t Ega, Ege, Egi, Ego, Egu;
        uint64_t Eka, Eke, Eki, Eko, Eku;
        uint64_t Ema, Eme, Emi, Emo, Emu;
        uint64_t Esa, Ese, Esi, Eso, Esu;
        //*addr = 11;
        //copyFromState(A, state)
        Aba = state[ 0];
        Abe = state[ 1];
        Abi = state[ 2];
        Abo = state[ 3];
        Abu = state[ 4];
        Aga = state[ 5];
        Age = state[ 6];
        Agi = state[ 7];
        Ago = state[ 8];
        Agu = state[ 9];
        Aka = state[10];
        Ake = state[11];
        Aki = state[12];
        Ako = state[13];
        Aku = state[14];
        Ama = state[15];
        Ame = state[16];
        Ami = state[17];
        Amo = state[18];
        Amu = state[19];
        Asa = state[20];
        Ase = state[21];
        Asi = state[22];
        Aso = state[23];
        Asu = state[24];
//*addr = 22;
        for( round = 0; round < NROUNDS; round += 2 )
        {
            //    prepareTheta
            BCa = Aba^Aga^Aka^Ama^Asa;
            BCe = Abe^Age^Ake^Ame^Ase;
            BCi = Abi^Agi^Aki^Ami^Asi;
            BCo = Abo^Ago^Ako^Amo^Aso;
            BCu = Abu^Agu^Aku^Amu^Asu;
*addr = round;
            //thetaRhoPiChiIotaPrepareTheta(round  , A, E)
            Da = BCu^ROL(BCe, 1);
            De = BCa^ROL(BCi, 1);
            Di = BCe^ROL(BCo, 1);
            Do = BCi^ROL(BCu, 1);
            Du = BCo^ROL(BCa, 1);

            Aba ^= Da;
            BCa = Aba;
            Age ^= De;
            BCe = ROL(Age, 44);
            Aki ^= Di;
            BCi = ROL(Aki, 43);
            Amo ^= Do;
            BCo = ROL(Amo, 21);
            Asu ^= Du;
            BCu = ROL(Asu, 14);
            Eba =   BCa ^((~BCe)&  BCi );
            Eba ^= (uint64_t)KeccakF_RoundConstants[round];
            Ebe =   BCe ^((~BCi)&  BCo );
            Ebi =   BCi ^((~BCo)&  BCu );
            Ebo =   BCo ^((~BCu)&  BCa );
            Ebu =   BCu ^((~BCa)&  BCe );

            Abo ^= Do;
            BCa = ROL(Abo, 28);
            Agu ^= Du;
            BCe = ROL(Agu, 20);
            Aka ^= Da;
            BCi = ROL(Aka,  3);
            Ame ^= De;
            BCo = ROL(Ame, 45);
            Asi ^= Di;
            BCu = ROL(Asi, 61);
            Ega =   BCa ^((~BCe)&  BCi );
            Ege =   BCe ^((~BCi)&  BCo );
            Egi =   BCi ^((~BCo)&  BCu );
            Ego =   BCo ^((~BCu)&  BCa );
            Egu =   BCu ^((~BCa)&  BCe );

            Abe ^= De;
            BCa = ROL(Abe,  1);
            Agi ^= Di;
            BCe = ROL(Agi,  6);
            Ako ^= Do;
            BCi = ROL(Ako, 25);
            Amu ^= Du;
            BCo = ROL(Amu,  8);
            Asa ^= Da;
            BCu = ROL(Asa, 18);
            Eka =   BCa ^((~BCe)&  BCi );
            Eke =   BCe ^((~BCi)&  BCo );
            Eki =   BCi ^((~BCo)&  BCu );
            Eko =   BCo ^((~BCu)&  BCa );
            Eku =   BCu ^((~BCa)&  BCe );

            Abu ^= Du;
            BCa = ROL(Abu, 27);
            Aga ^= Da;
            BCe = ROL(Aga, 36);
            Ake ^= De;
            BCi = ROL(Ake, 10);
            Ami ^= Di;
            BCo = ROL(Ami, 15);
            Aso ^= Do;
            BCu = ROL(Aso, 56);
            Ema =   BCa ^((~BCe)&  BCi );
            Eme =   BCe ^((~BCi)&  BCo );
            Emi =   BCi ^((~BCo)&  BCu );
            Emo =   BCo ^((~BCu)&  BCa );
            Emu =   BCu ^((~BCa)&  BCe );

            Abi ^= Di;
            BCa = ROL(Abi, 62);
            Ago ^= Do;
            BCe = ROL(Ago, 55);
            Aku ^= Du;
            BCi = ROL(Aku, 39);
            Ama ^= Da;
            BCo = ROL(Ama, 41);
            Ase ^= De;
            BCu = ROL(Ase,  2);
            Esa =   BCa ^((~BCe)&  BCi );
            Ese =   BCe ^((~BCi)&  BCo );
            Esi =   BCi ^((~BCo)&  BCu );
            Eso =   BCo ^((~BCu)&  BCa );
            Esu =   BCu ^((~BCa)&  BCe );

            //    prepareTheta
            BCa = Eba^Ega^Eka^Ema^Esa;
            BCe = Ebe^Ege^Eke^Eme^Ese;
            BCi = Ebi^Egi^Eki^Emi^Esi;
            BCo = Ebo^Ego^Eko^Emo^Eso;
            BCu = Ebu^Egu^Eku^Emu^Esu;

            //thetaRhoPiChiIotaPrepareTheta(round+1, E, A)
            Da = BCu^ROL(BCe, 1);
            De = BCa^ROL(BCi, 1);
            Di = BCe^ROL(BCo, 1);
            Do = BCi^ROL(BCu, 1);
            Du = BCo^ROL(BCa, 1);

            Eba ^= Da;
            BCa = Eba;
            Ege ^= De;
            BCe = ROL(Ege, 44);
            Eki ^= Di;
            BCi = ROL(Eki, 43);
            Emo ^= Do;
            BCo = ROL(Emo, 21);
            Esu ^= Du;
            BCu = ROL(Esu, 14);
            Aba =   BCa ^((~BCe)&  BCi );
            Aba ^= (uint64_t)KeccakF_RoundConstants[round+1];
            Abe =   BCe ^((~BCi)&  BCo );
            Abi =   BCi ^((~BCo)&  BCu );
            Abo =   BCo ^((~BCu)&  BCa );
            Abu =   BCu ^((~BCa)&  BCe );

            Ebo ^= Do;
            BCa = ROL(Ebo, 28);
            Egu ^= Du;
            BCe = ROL(Egu, 20);
            Eka ^= Da;
            BCi = ROL(Eka, 3);
            Eme ^= De;
            BCo = ROL(Eme, 45);
            Esi ^= Di;
            BCu = ROL(Esi, 61);
            Aga =   BCa ^((~BCe)&  BCi );
            Age =   BCe ^((~BCi)&  BCo );
            Agi =   BCi ^((~BCo)&  BCu );
            Ago =   BCo ^((~BCu)&  BCa );
            Agu =   BCu ^((~BCa)&  BCe );

            Ebe ^= De;
            BCa = ROL(Ebe, 1);
            Egi ^= Di;
            BCe = ROL(Egi, 6);
            Eko ^= Do;
            BCi = ROL(Eko, 25);
            Emu ^= Du;
            BCo = ROL(Emu, 8);
            Esa ^= Da;
            BCu = ROL(Esa, 18);
            Aka =   BCa ^((~BCe)&  BCi );
            Ake =   BCe ^((~BCi)&  BCo );
            Aki =   BCi ^((~BCo)&  BCu );
            Ako =   BCo ^((~BCu)&  BCa );
            Aku =   BCu ^((~BCa)&  BCe );

            Ebu ^= Du;
            BCa = ROL(Ebu, 27);
            Ega ^= Da;
            BCe = ROL(Ega, 36);
            Eke ^= De;
            BCi = ROL(Eke, 10);
            Emi ^= Di;
            BCo = ROL(Emi, 15);
            Eso ^= Do;
            BCu = ROL(Eso, 56);
            Ama =   BCa ^((~BCe)&  BCi );
            Ame =   BCe ^((~BCi)&  BCo );
            Ami =   BCi ^((~BCo)&  BCu );
            Amo =   BCo ^((~BCu)&  BCa );
            Amu =   BCu ^((~BCa)&  BCe );

            Ebi ^= Di;
            BCa = ROL(Ebi, 62);
            Ego ^= Do;
            BCe = ROL(Ego, 55);
            Eku ^= Du;
            BCi = ROL(Eku, 39);
            Ema ^= Da;
            BCo = ROL(Ema, 41);
            Ese ^= De;
            BCu = ROL(Ese, 2);
            Asa =   BCa ^((~BCe)&  BCi );
            Ase =   BCe ^((~BCi)&  BCo );
            Asi =   BCi ^((~BCo)&  BCu );
            Aso =   BCo ^((~BCu)&  BCa );
            Asu =   BCu ^((~BCa)&  BCe );
        }
//*addr = 55;
        //copyToState(state, A)
        state[ 0] = Aba;
        state[ 1] = Abe;
        state[ 2] = Abi;
        state[ 3] = Abo;
        state[ 4] = Abu;
        state[ 5] = Aga;
        state[ 6] = Age;
        state[ 7] = Agi;
        state[ 8] = Ago;
        state[ 9] = Agu;
        state[10] = Aka;
        state[11] = Ake;
        state[12] = Aki;
        state[13] = Ako;
        state[14] = Aku;
        state[15] = Ama;
        state[16] = Ame;
        state[17] = Ami;
        state[18] = Amo;
        state[19] = Amu;
        state[20] = Asa;
        state[21] = Ase;
        state[22] = Asi;
        state[23] = Aso;
        state[24] = Asu;
        *addr = 88;
}*/

/*
static void poly_naivemul(poly *c, const poly *a, const poly *b) {
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
int main(void) {

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
int main(int argc, char **argv) {

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
int main(void) {
  
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

#include "params.h"
#include "poly.h"
#include "params.h"
#include "sign.h"
#include "packing.h"
#include "polyvec.h"
#include "poly.h"
#include "symmetric.h"
#include "fips202.h"
#define GPIO_BASE 0x00008010
#include <stdint.h>

int main() {
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


  return 0;
}