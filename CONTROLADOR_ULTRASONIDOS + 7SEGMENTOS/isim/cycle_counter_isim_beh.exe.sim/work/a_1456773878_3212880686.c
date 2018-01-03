/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Tami/Desktop/PRACTICAS DIGITAL/ULTRASONIDOS/CONTROLADOR_ULTRASONIDOS + 7SEGMENTOS/cycle_counter_19455.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
char *ieee_p_3620187407_sub_674691591_3965413181(char *, char *, char *, char *, unsigned char );


static void work_a_1456773878_3212880686_p_0(char *t0)
{
    char t18[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    unsigned int t19;
    unsigned int t20;

LAB0:    xsi_set_current_line(55, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 4168);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(56, ng0);
    t1 = xsi_get_transient_memory(15U);
    memset(t1, 0, 15U);
    t5 = t1;
    memset(t5, (unsigned char)2, 15U);
    t6 = (t0 + 4280);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 15U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 1352U);
    t5 = *((char **)t2);
    t4 = *((unsigned char *)t5);
    t11 = (t4 == (unsigned char)3);
    if (t11 != 0)
        goto LAB7;

LAB9:
LAB8:    goto LAB3;

LAB7:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 1832U);
    t6 = *((char **)t2);
    t2 = (t0 + 7432U);
    t7 = (t0 + 2368U);
    t8 = *((char **)t7);
    t7 = (t0 + 7448U);
    t12 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t6, t2, t8, t7);
    if (t12 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(62, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 7432U);
    t5 = ieee_p_3620187407_sub_674691591_3965413181(IEEE_P_3620187407, t18, t2, t1, (unsigned char)3);
    t6 = (t18 + 12U);
    t19 = *((unsigned int *)t6);
    t20 = (1U * t19);
    t3 = (15U != t20);
    if (t3 == 1)
        goto LAB13;

LAB14:    t7 = (t0 + 4280);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t13 = *((char **)t10);
    memcpy(t13, t5, 15U);
    xsi_driver_first_trans_fast(t7);

LAB11:    goto LAB8;

LAB10:    xsi_set_current_line(60, ng0);
    t9 = xsi_get_transient_memory(15U);
    memset(t9, 0, 15U);
    t10 = t9;
    memset(t10, (unsigned char)2, 15U);
    t13 = (t0 + 4280);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t9, 15U);
    xsi_driver_first_trans_fast(t13);
    goto LAB11;

LAB13:    xsi_size_not_matching(15U, t20, 0);
    goto LAB14;

}

static void work_a_1456773878_3212880686_p_1(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned char t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t2 = (t0 + 7432U);
    t4 = (t0 + 2368U);
    t5 = *((char **)t4);
    t4 = (t0 + 7448U);
    t6 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t3, t2, t5, t4);
    if (t6 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 4344);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);

LAB3:    t2 = (t0 + 4184);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(71, ng0);
    t7 = (t0 + 4344);
    t11 = (t7 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t7);
    goto LAB3;

LAB5:    t7 = (t0 + 1352U);
    t8 = *((char **)t7);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    t1 = t10;
    goto LAB7;

}

static void work_a_1456773878_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(77, ng0);

LAB3:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 4408);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 15U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4200);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_1456773878_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1456773878_3212880686_p_0,(void *)work_a_1456773878_3212880686_p_1,(void *)work_a_1456773878_3212880686_p_2};
	xsi_register_didat("work_a_1456773878_3212880686", "isim/cycle_counter_isim_beh.exe.sim/work/a_1456773878_3212880686.didat");
	xsi_register_executes(pe);
}
