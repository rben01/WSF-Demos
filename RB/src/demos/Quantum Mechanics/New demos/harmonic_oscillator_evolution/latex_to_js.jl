# %%
import Lazy.@as
using InteractiveUtils

strings = raw"""
0: 1

1: 4 I p \[Sigma]^2+2 \[Mu] \[HBar]

2: 2 (-8 p^2 \[Sigma]^4+8 I p \[Mu] \[Sigma]^2 \[HBar]+(-1+2 \[Mu]^2+4 \[Sigma]^4)
\[HBar]^2)

3: -4 I (2 p \[Sigma]^2-I \[Mu] \[HBar]) (8 p^2 \[Sigma]^4-8 I p \[Mu] \[Sigma]^2
\[HBar]+(3-2 \[Mu]^2-12 \[Sigma]^4) \[HBar]^2)

4: 4 (64 p^4 \[Sigma]^8-128 I p^3 \[Mu] \[Sigma]^6 \[HBar]-48 p^2 \[Sigma]^4 (-1+2
\[Mu]^2+4 \[Sigma]^4) \[HBar]^2+16 I p \[Mu] \[Sigma]^2 (-3+2 \[Mu]^2+12 \[Sigma]^4)
\[HBar]^3+(4 \[Mu]^4+3 (1-4 \[Sigma]^4)^2+12 \[Mu]^2 (-1+4 \[Sigma]^4)) \[HBar]^4)

5: 8 (128 I p^5 \[Sigma]^10+320 p^4 \[Mu] \[Sigma]^8 \[HBar]-160 I p^3 \[Sigma]^6 (-1+2
\[Mu]^2+4 \[Sigma]^4) \[HBar]^2-80 p^2 \[Mu] \[Sigma]^4 (-3+2 \[Mu]^2+12 \[Sigma]^4)
\[HBar]^3+10 I p \[Sigma]^2 (4 \[Mu]^4+3 (1-4 \[Sigma]^4)^2+12 \[Mu]^2 (-1+4
\[Sigma]^4)) \[HBar]^4+\[Mu] (4 \[Mu]^4+15 (1-4 \[Sigma]^4)^2+20 \[Mu]^2 (-1+4
\[Sigma]^4)) \[HBar]^5)

6: 8 (-512 p^6 \[Sigma]^12+1536 I p^5 \[Mu] \[Sigma]^10 \[HBar]+960 p^4 \[Sigma]^8 (-1+2
\[Mu]^2+4 \[Sigma]^4) \[HBar]^2-640 I p^3 \[Mu] \[Sigma]^6 (-3+2 \[Mu]^2+12 \[Sigma]^4)
\[HBar]^3-120 p^2 \[Sigma]^4 (4 \[Mu]^4+3 (1-4 \[Sigma]^4)^2+12 \[Mu]^2 (-1+4
\[Sigma]^4)) \[HBar]^4+24 I p \[Mu] \[Sigma]^2 (4 \[Mu]^4+15 (1-4 \[Sigma]^4)^2+20
\[Mu]^2 (-1+4 \[Sigma]^4)) \[HBar]^5+(8 \[Mu]^6+90 \[Mu]^2 (1-4 \[Sigma]^4)^2+60 \[Mu]^4
(-1+4 \[Sigma]^4)+15 (-1+4 \[Sigma]^4)^3) \[HBar]^6)

7: 16 (-1024 I p^7 \[Sigma]^14-3584 p^6 \[Mu] \[Sigma]^12 \[HBar]+2688 I p^5 \[Sigma]^10
(-1+2 \[Mu]^2+4 \[Sigma]^4) \[HBar]^2+2240 p^4 \[Mu] \[Sigma]^8 (-3+2 \[Mu]^2+12
\[Sigma]^4) \[HBar]^3-560 I p^3 \[Sigma]^6 (4 \[Mu]^4+3 (1-4 \[Sigma]^4)^2+12 \[Mu]^2
(-1+4 \[Sigma]^4)) \[HBar]^4-168 p^2 \[Mu] \[Sigma]^4 (4 \[Mu]^4+15 (1-4
\[Sigma]^4)^2+20 \[Mu]^2 (-1+4 \[Sigma]^4)) \[HBar]^5+14 I p \[Sigma]^2 (8 \[Mu]^6+90
\[Mu]^2 (1-4 \[Sigma]^4)^2+60 \[Mu]^4 (-1+4 \[Sigma]^4)+15 (-1+4 \[Sigma]^4)^3)
\[HBar]^6+\[Mu] (8 \[Mu]^6+210 \[Mu]^2 (1-4 \[Sigma]^4)^2+84 \[Mu]^4 (-1+4
\[Sigma]^4)+105 (-1+4 \[Sigma]^4)^3) \[HBar]^7)

8: 16 (4096 p^8 \[Sigma]^16-16384 I p^7 \[Mu] \[Sigma]^14 \[HBar]-14336 p^6 \[Sigma]^12
(-1+2 \[Mu]^2+4 \[Sigma]^4) \[HBar]^2+14336 I p^5 \[Mu] \[Sigma]^10 (-3+2 \[Mu]^2+12
\[Sigma]^4) \[HBar]^3+4480 p^4 \[Sigma]^8 (4 \[Mu]^4+3 (1-4 \[Sigma]^4)^2+12 \[Mu]^2
(-1+4 \[Sigma]^4)) \[HBar]^4-1792 I p^3 \[Mu] \[Sigma]^6 (4 \[Mu]^4+15 (1-4
\[Sigma]^4)^2+20 \[Mu]^2 (-1+4 \[Sigma]^4)) \[HBar]^5-224 p^2 \[Sigma]^4 (8 \[Mu]^6+90
\[Mu]^2 (1-4 \[Sigma]^4)^2+60 \[Mu]^4 (-1+4 \[Sigma]^4)+15 (-1+4 \[Sigma]^4)^3)
\[HBar]^6+32 I p \[Mu] \[Sigma]^2 (8 \[Mu]^6+210 \[Mu]^2 (1-4 \[Sigma]^4)^2+84 \[Mu]^4
(-1+4 \[Sigma]^4)+105 (-1+4 \[Sigma]^4)^3) \[HBar]^7+(16 \[Mu]^8+840 \[Mu]^4 (1-4
\[Sigma]^4)^2+105 (1-4 \[Sigma]^4)^4+224 \[Mu]^6 (-1+4 \[Sigma]^4)+840 \[Mu]^2 (-1+4
\[Sigma]^4)^3) \[HBar]^8)

9: 32 (8192 I p^9 \[Sigma]^18+36864 p^8 \[Mu] \[Sigma]^16 \[HBar]-36864 I p^7
\[Sigma]^14 (-1+2 \[Mu]^2+4 \[Sigma]^4) \[HBar]^2-43008 p^6 \[Mu] \[Sigma]^12 (-3+2
\[Mu]^2+12 \[Sigma]^4) \[HBar]^3+16128 I p^5 \[Sigma]^10 (4 \[Mu]^4+3 (1-4
\[Sigma]^4)^2+12 \[Mu]^2 (-1+4 \[Sigma]^4)) \[HBar]^4+8064 p^4 \[Mu] \[Sigma]^8 (4
\[Mu]^4+15 (1-4 \[Sigma]^4)^2+20 \[Mu]^2 (-1+4 \[Sigma]^4)) \[HBar]^5-1344 I p^3
\[Sigma]^6 (8 \[Mu]^6+90 \[Mu]^2 (1-4 \[Sigma]^4)^2+60 \[Mu]^4 (-1+4 \[Sigma]^4)+15
(-1+4 \[Sigma]^4)^3) \[HBar]^6-288 p^2 \[Mu] \[Sigma]^4 (8 \[Mu]^6+210 \[Mu]^2 (1-4
\[Sigma]^4)^2+84 \[Mu]^4 (-1+4 \[Sigma]^4)+105 (-1+4 \[Sigma]^4)^3) \[HBar]^7+18 I p
\[Sigma]^2 (16 \[Mu]^8+840 \[Mu]^4 (1-4 \[Sigma]^4)^2+105 (1-4 \[Sigma]^4)^4+224 \[Mu]^6
(-1+4 \[Sigma]^4)+840 \[Mu]^2 (-1+4 \[Sigma]^4)^3) \[HBar]^8+\[Mu] (16 \[Mu]^8+1512
\[Mu]^4 (1-4 \[Sigma]^4)^2+945 (1-4 \[Sigma]^4)^4+288 \[Mu]^6 (-1+4 \[Sigma]^4)+2520
\[Mu]^2 (-1+4 \[Sigma]^4)^3) \[HBar]^9)

10: 32 (-32768 p^10 \[Sigma]^20+163840 I p^9 \[Mu] \[Sigma]^18 \[HBar]+184320 p^8
\[Sigma]^16 (-1+2 \[Mu]^2+4 \[Sigma]^4) \[HBar]^2-245760 I p^7 \[Mu] \[Sigma]^14 (-3+2
\[Mu]^2+12 \[Sigma]^4) \[HBar]^3-107520 p^6 \[Sigma]^12 (4 \[Mu]^4+3 (1-4
\[Sigma]^4)^2+12 \[Mu]^2 (-1+4 \[Sigma]^4)) \[HBar]^4+64512 I p^5 \[Mu] \[Sigma]^10 (4
\[Mu]^4+15 (1-4 \[Sigma]^4)^2+20 \[Mu]^2 (-1+4 \[Sigma]^4)) \[HBar]^5+13440 p^4
\[Sigma]^8 (8 \[Mu]^6+90 \[Mu]^2 (1-4 \[Sigma]^4)^2+60 \[Mu]^4 (-1+4 \[Sigma]^4)+15
(-1+4 \[Sigma]^4)^3) \[HBar]^6-3840 I p^3 \[Mu] \[Sigma]^6 (8 \[Mu]^6+210 \[Mu]^2 (1-4
\[Sigma]^4)^2+84 \[Mu]^4 (-1+4 \[Sigma]^4)+105 (-1+4 \[Sigma]^4)^3) \[HBar]^7-360 p^2
\[Sigma]^4 (16 \[Mu]^8+840 \[Mu]^4 (1-4 \[Sigma]^4)^2+105 (1-4 \[Sigma]^4)^4+224 \[Mu]^6
(-1+4 \[Sigma]^4)+840 \[Mu]^2 (-1+4 \[Sigma]^4)^3) \[HBar]^8+40 I p \[Mu] \[Sigma]^2 (16
\[Mu]^8+1512 \[Mu]^4 (1-4 \[Sigma]^4)^2+945 (1-4 \[Sigma]^4)^4+288 \[Mu]^6 (-1+4
\[Sigma]^4)+2520 \[Mu]^2 (-1+4 \[Sigma]^4)^3) \[HBar]^9+(32 \[Mu]^10+5040 \[Mu]^6 (1-4
\[Sigma]^4)^2+9450 \[Mu]^2 (1-4 \[Sigma]^4)^4+720 \[Mu]^8 (-1+4 \[Sigma]^4)+12600
\[Mu]^4 (-1+4 \[Sigma]^4)^3+945 (-1+4 \[Sigma]^4)^5) \[HBar]^10)

11: 64 (-65536 I p^11 \[Sigma]^22-360448 p^10 \[Mu] \[Sigma]^20 \[HBar]+450560 I p^9
\[Sigma]^18 (-1+2 \[Mu]^2+4 \[Sigma]^4) \[HBar]^2+675840 p^8 \[Mu] \[Sigma]^16 (-3+2
\[Mu]^2+12 \[Sigma]^4) \[HBar]^3-337920 I p^7 \[Sigma]^14 (4 \[Mu]^4+3 (1-4
\[Sigma]^4)^2+12 \[Mu]^2 (-1+4 \[Sigma]^4)) \[HBar]^4-236544 p^6 \[Mu] \[Sigma]^12 (4
\[Mu]^4+15 (1-4 \[Sigma]^4)^2+20 \[Mu]^2 (-1+4 \[Sigma]^4)) \[HBar]^5+59136 I p^5
\[Sigma]^10 (8 \[Mu]^6+90 \[Mu]^2 (1-4 \[Sigma]^4)^2+60 \[Mu]^4 (-1+4 \[Sigma]^4)+15
(-1+4 \[Sigma]^4)^3) \[HBar]^6+21120 p^4 \[Mu] \[Sigma]^8 (8 \[Mu]^6+210 \[Mu]^2 (1-4
\[Sigma]^4)^2+84 \[Mu]^4 (-1+4 \[Sigma]^4)+105 (-1+4 \[Sigma]^4)^3) \[HBar]^7-2640 I p^3
\[Sigma]^6 (16 \[Mu]^8+840 \[Mu]^4 (1-4 \[Sigma]^4)^2+105 (1-4 \[Sigma]^4)^4+224 \[Mu]^6
(-1+4 \[Sigma]^4)+840 \[Mu]^2 (-1+4 \[Sigma]^4)^3) \[HBar]^8-440 p^2 \[Mu] \[Sigma]^4
(16 \[Mu]^8+1512 \[Mu]^4 (1-4 \[Sigma]^4)^2+945 (1-4 \[Sigma]^4)^4+288 \[Mu]^6 (-1+4
\[Sigma]^4)+2520 \[Mu]^2 (-1+4 \[Sigma]^4)^3) \[HBar]^9+22 I p \[Sigma]^2 (32
\[Mu]^10+5040 \[Mu]^6 (1-4 \[Sigma]^4)^2+9450 \[Mu]^2 (1-4 \[Sigma]^4)^4+720 \[Mu]^8
(-1+4 \[Sigma]^4)+12600 \[Mu]^4 (-1+4 \[Sigma]^4)^3+945 (-1+4 \[Sigma]^4)^5)
\[HBar]^10+\[Mu] (32 \[Mu]^10+7920 \[Mu]^6 (1-4 \[Sigma]^4)^2+34650 \[Mu]^2 (1-4
\[Sigma]^4)^4+880 \[Mu]^8 (-1+4 \[Sigma]^4)+27720 \[Mu]^4 (-1+4 \[Sigma]^4)^3+10395
(-1+4 \[Sigma]^4)^5) \[HBar]^11)

12: 64 (262144 p^12 \[Sigma]^24-1572864 I p^11 \[Mu] \[Sigma]^22 \[HBar]-2162688 p^10
\[Sigma]^20 (-1+2 \[Mu]^2+4 \[Sigma]^4) \[HBar]^2+3604480 I p^9 \[Mu] \[Sigma]^18 (-3+2
\[Mu]^2+12 \[Sigma]^4) \[HBar]^3+2027520 p^8 \[Sigma]^16 (4 \[Mu]^4+3 (1-4
\[Sigma]^4)^2+12 \[Mu]^2 (-1+4 \[Sigma]^4)) \[HBar]^4-1622016 I p^7 \[Mu] \[Sigma]^14 (4
\[Mu]^4+15 (1-4 \[Sigma]^4)^2+20 \[Mu]^2 (-1+4 \[Sigma]^4)) \[HBar]^5-473088 p^6
\[Sigma]^12 (8 \[Mu]^6+90 \[Mu]^2 (1-4 \[Sigma]^4)^2+60 \[Mu]^4 (-1+4 \[Sigma]^4)+15
(-1+4 \[Sigma]^4)^3) \[HBar]^6+202752 I p^5 \[Mu] \[Sigma]^10 (8 \[Mu]^6+210 \[Mu]^2
(1-4 \[Sigma]^4)^2+84 \[Mu]^4 (-1+4 \[Sigma]^4)+105 (-1+4 \[Sigma]^4)^3) \[HBar]^7+31680
p^4 \[Sigma]^8 (16 \[Mu]^8+840 \[Mu]^4 (1-4 \[Sigma]^4)^2+105 (1-4 \[Sigma]^4)^4+224
\[Mu]^6 (-1+4 \[Sigma]^4)+840 \[Mu]^2 (-1+4 \[Sigma]^4)^3) \[HBar]^8-7040 I p^3 \[Mu]
\[Sigma]^6 (16 \[Mu]^8+1512 \[Mu]^4 (1-4 \[Sigma]^4)^2+945 (1-4 \[Sigma]^4)^4+288
\[Mu]^6 (-1+4 \[Sigma]^4)+2520 \[Mu]^2 (-1+4 \[Sigma]^4)^3) \[HBar]^9-528 p^2 \[Sigma]^4
(32 \[Mu]^10+5040 \[Mu]^6 (1-4 \[Sigma]^4)^2+9450 \[Mu]^2 (1-4 \[Sigma]^4)^4+720 \[Mu]^8
(-1+4 \[Sigma]^4)+12600 \[Mu]^4 (-1+4 \[Sigma]^4)^3+945 (-1+4 \[Sigma]^4)^5)
\[HBar]^10+48 I p \[Mu] \[Sigma]^2 (32 \[Mu]^10+7920 \[Mu]^6 (1-4 \[Sigma]^4)^2+34650
\[Mu]^2 (1-4 \[Sigma]^4)^4+880 \[Mu]^8 (-1+4 \[Sigma]^4)+27720 \[Mu]^4 (-1+4
\[Sigma]^4)^3+10395 (-1+4 \[Sigma]^4)^5) \[HBar]^11+(64 \[Mu]^12+23760 \[Mu]^8 (1-4
\[Sigma]^4)^2+207900 \[Mu]^4 (1-4 \[Sigma]^4)^4+10395 (1-4 \[Sigma]^4)^6+2112 \[Mu]^10
(-1+4 \[Sigma]^4)+110880 \[Mu]^6 (-1+4 \[Sigma]^4)^3+124740 \[Mu]^2 (-1+4 \[Sigma]^4)^5)
\[HBar]^12)

13: 128 (524288 I p^13 \[Sigma]^26+3407872 p^12 \[Mu] \[Sigma]^24 \[HBar]-5111808 I p^11
\[Sigma]^22 (-1+2 \[Mu]^2+4 \[Sigma]^4) \[HBar]^2-9371648 p^10 \[Mu] \[Sigma]^20 (-3+2
\[Mu]^2+12 \[Sigma]^4) \[HBar]^3+5857280 I p^9 \[Sigma]^18 (4 \[Mu]^4+3 (1-4
\[Sigma]^4)^2+12 \[Mu]^2 (-1+4 \[Sigma]^4)) \[HBar]^4+5271552 p^8 \[Mu] \[Sigma]^16 (4
\[Mu]^4+15 (1-4 \[Sigma]^4)^2+20 \[Mu]^2 (-1+4 \[Sigma]^4)) \[HBar]^5-1757184 I p^7
\[Sigma]^14 (8 \[Mu]^6+90 \[Mu]^2 (1-4 \[Sigma]^4)^2+60 \[Mu]^4 (-1+4 \[Sigma]^4)+15
(-1+4 \[Sigma]^4)^3) \[HBar]^6-878592 p^6 \[Mu] \[Sigma]^12 (8 \[Mu]^6+210 \[Mu]^2 (1-4
\[Sigma]^4)^2+84 \[Mu]^4 (-1+4 \[Sigma]^4)+105 (-1+4 \[Sigma]^4)^3) \[HBar]^7+164736 I
p^5 \[Sigma]^10 (16 \[Mu]^8+840 \[Mu]^4 (1-4 \[Sigma]^4)^2+105 (1-4 \[Sigma]^4)^4+224
\[Mu]^6 (-1+4 \[Sigma]^4)+840 \[Mu]^2 (-1+4 \[Sigma]^4)^3) \[HBar]^8+45760 p^4 \[Mu]
\[Sigma]^8 (16 \[Mu]^8+1512 \[Mu]^4 (1-4 \[Sigma]^4)^2+945 (1-4 \[Sigma]^4)^4+288
\[Mu]^6 (-1+4 \[Sigma]^4)+2520 \[Mu]^2 (-1+4 \[Sigma]^4)^3) \[HBar]^9-4576 I p^3
\[Sigma]^6 (32 \[Mu]^10+5040 \[Mu]^6 (1-4 \[Sigma]^4)^2+9450 \[Mu]^2 (1-4
\[Sigma]^4)^4+720 \[Mu]^8 (-1+4 \[Sigma]^4)+12600 \[Mu]^4 (-1+4 \[Sigma]^4)^3+945 (-1+4
\[Sigma]^4)^5) \[HBar]^10-624 p^2 \[Mu] \[Sigma]^4 (32 \[Mu]^10+7920 \[Mu]^6 (1-4
\[Sigma]^4)^2+34650 \[Mu]^2 (1-4 \[Sigma]^4)^4+880 \[Mu]^8 (-1+4 \[Sigma]^4)+27720
\[Mu]^4 (-1+4 \[Sigma]^4)^3+10395 (-1+4 \[Sigma]^4)^5) \[HBar]^11+26 I p \[Sigma]^2 (64
\[Mu]^12+23760 \[Mu]^8 (1-4 \[Sigma]^4)^2+207900 \[Mu]^4 (1-4 \[Sigma]^4)^4+10395 (1-4
\[Sigma]^4)^6+2112 \[Mu]^10 (-1+4 \[Sigma]^4)+110880 \[Mu]^6 (-1+4 \[Sigma]^4)^3+124740
\[Mu]^2 (-1+4 \[Sigma]^4)^5) \[HBar]^12+\[Mu] (64 \[Mu]^12+34320 \[Mu]^8 (1-4
\[Sigma]^4)^2+540540 \[Mu]^4 (1-4 \[Sigma]^4)^4+135135 (1-4 \[Sigma]^4)^6+2496 \[Mu]^10
(-1+4 \[Sigma]^4)+205920 \[Mu]^6 (-1+4 \[Sigma]^4)^3+540540 \[Mu]^2 (-1+4 \[Sigma]^4)^5)
\[HBar]^13)

14: 128 (-2097152 p^14 \[Sigma]^28+14680064 I p^13 \[Mu] \[Sigma]^26 \[HBar]+23855104
p^12 \[Sigma]^24 (-1+2 \[Mu]^2+4 \[Sigma]^4) \[HBar]^2-47710208 I p^11 \[Mu] \[Sigma]^22
(-3+2 \[Mu]^2+12 \[Sigma]^4) \[HBar]^3-32800768 p^10 \[Sigma]^20 (4 \[Mu]^4+3 (1-4
\[Sigma]^4)^2+12 \[Mu]^2 (-1+4 \[Sigma]^4)) \[HBar]^4+32800768 I p^9 \[Mu] \[Sigma]^18
(4 \[Mu]^4+15 (1-4 \[Sigma]^4)^2+20 \[Mu]^2 (-1+4 \[Sigma]^4)) \[HBar]^5+12300288 p^8
\[Sigma]^16 (8 \[Mu]^6+90 \[Mu]^2 (1-4 \[Sigma]^4)^2+60 \[Mu]^4 (-1+4 \[Sigma]^4)+15
(-1+4 \[Sigma]^4)^3) \[HBar]^6-7028736 I p^7 \[Mu] \[Sigma]^14 (8 \[Mu]^6+210 \[Mu]^2
(1-4 \[Sigma]^4)^2+84 \[Mu]^4 (-1+4 \[Sigma]^4)+105 (-1+4 \[Sigma]^4)^3)
\[HBar]^7-1537536 p^6 \[Sigma]^12 (16 \[Mu]^8+840 \[Mu]^4 (1-4 \[Sigma]^4)^2+105 (1-4
\[Sigma]^4)^4+224 \[Mu]^6 (-1+4 \[Sigma]^4)+840 \[Mu]^2 (-1+4 \[Sigma]^4)^3)
\[HBar]^8+512512 I p^5 \[Mu] \[Sigma]^10 (16 \[Mu]^8+1512 \[Mu]^4 (1-4 \[Sigma]^4)^2+945
(1-4 \[Sigma]^4)^4+288 \[Mu]^6 (-1+4 \[Sigma]^4)+2520 \[Mu]^2 (-1+4 \[Sigma]^4)^3)
\[HBar]^9+64064 p^4 \[Sigma]^8 (32 \[Mu]^10+5040 \[Mu]^6 (1-4 \[Sigma]^4)^2+9450 \[Mu]^2
(1-4 \[Sigma]^4)^4+720 \[Mu]^8 (-1+4 \[Sigma]^4)+12600 \[Mu]^4 (-1+4 \[Sigma]^4)^3+945
(-1+4 \[Sigma]^4)^5) \[HBar]^10-11648 I p^3 \[Mu] \[Sigma]^6 (32 \[Mu]^10+7920 \[Mu]^6
(1-4 \[Sigma]^4)^2+34650 \[Mu]^2 (1-4 \[Sigma]^4)^4+880 \[Mu]^8 (-1+4 \[Sigma]^4)+27720
\[Mu]^4 (-1+4 \[Sigma]^4)^3+10395 (-1+4 \[Sigma]^4)^5) \[HBar]^11-728 p^2 \[Sigma]^4 (64
\[Mu]^12+23760 \[Mu]^8 (1-4 \[Sigma]^4)^2+207900 \[Mu]^4 (1-4 \[Sigma]^4)^4+10395 (1-4
\[Sigma]^4)^6+2112 \[Mu]^10 (-1+4 \[Sigma]^4)+110880 \[Mu]^6 (-1+4 \[Sigma]^4)^3+124740
\[Mu]^2 (-1+4 \[Sigma]^4)^5) \[HBar]^12+56 I p \[Mu] \[Sigma]^2 (64 \[Mu]^12+34320
\[Mu]^8 (1-4 \[Sigma]^4)^2+540540 \[Mu]^4 (1-4 \[Sigma]^4)^4+135135 (1-4
\[Sigma]^4)^6+2496 \[Mu]^10 (-1+4 \[Sigma]^4)+205920 \[Mu]^6 (-1+4 \[Sigma]^4)^3+540540
\[Mu]^2 (-1+4 \[Sigma]^4)^5) \[HBar]^13+(128 \[Mu]^14+96096 \[Mu]^10 (1-4
\[Sigma]^4)^2+2522520 \[Mu]^6 (1-4 \[Sigma]^4)^4+1891890 \[Mu]^2 (1-4 \[Sigma]^4)^6+5824
\[Mu]^12 (-1+4 \[Sigma]^4)+720720 \[Mu]^8 (-1+4 \[Sigma]^4)^3+3783780 \[Mu]^4 (-1+4
\[Sigma]^4)^5+135135 (-1+4 \[Sigma]^4)^7) \[HBar]^14)

15: 256 (-4194304 I p^15 \[Sigma]^30-31457280 p^14 \[Mu] \[Sigma]^28 \[HBar]+55050240 I
p^13 \[Sigma]^26 (-1+2 \[Mu]^2+4 \[Sigma]^4) \[HBar]^2+119275520 p^12 \[Mu] \[Sigma]^24
(-3+2 \[Mu]^2+12 \[Sigma]^4) \[HBar]^3-89456640 I p^11 \[Sigma]^22 (4 \[Mu]^4+3 (1-4
\[Sigma]^4)^2+12 \[Mu]^2 (-1+4 \[Sigma]^4)) \[HBar]^4-98402304 p^10 \[Mu] \[Sigma]^20 (4
\[Mu]^4+15 (1-4 \[Sigma]^4)^2+20 \[Mu]^2 (-1+4 \[Sigma]^4)) \[HBar]^5+41000960 I p^9
\[Sigma]^18 (8 \[Mu]^6+90 \[Mu]^2 (1-4 \[Sigma]^4)^2+60 \[Mu]^4 (-1+4 \[Sigma]^4)+15
(-1+4 \[Sigma]^4)^3) \[HBar]^6+26357760 p^8 \[Mu] \[Sigma]^16 (8 \[Mu]^6+210 \[Mu]^2
(1-4 \[Sigma]^4)^2+84 \[Mu]^4 (-1+4 \[Sigma]^4)+105 (-1+4 \[Sigma]^4)^3)
\[HBar]^7-6589440 I p^7 \[Sigma]^14 (16 \[Mu]^8+840 \[Mu]^4 (1-4 \[Sigma]^4)^2+105 (1-4
\[Sigma]^4)^4+224 \[Mu]^6 (-1+4 \[Sigma]^4)+840 \[Mu]^2 (-1+4 \[Sigma]^4)^3)
\[HBar]^8-2562560 p^6 \[Mu] \[Sigma]^12 (16 \[Mu]^8+1512 \[Mu]^4 (1-4 \[Sigma]^4)^2+945
(1-4 \[Sigma]^4)^4+288 \[Mu]^6 (-1+4 \[Sigma]^4)+2520 \[Mu]^2 (-1+4 \[Sigma]^4)^3)
\[HBar]^9+384384 I p^5 \[Sigma]^10 (32 \[Mu]^10+5040 \[Mu]^6 (1-4 \[Sigma]^4)^2+9450
\[Mu]^2 (1-4 \[Sigma]^4)^4+720 \[Mu]^8 (-1+4 \[Sigma]^4)+12600 \[Mu]^4 (-1+4
\[Sigma]^4)^3+945 (-1+4 \[Sigma]^4)^5) \[HBar]^10+87360 p^4 \[Mu] \[Sigma]^8 (32
\[Mu]^10+7920 \[Mu]^6 (1-4 \[Sigma]^4)^2+34650 \[Mu]^2 (1-4 \[Sigma]^4)^4+880 \[Mu]^8
(-1+4 \[Sigma]^4)+27720 \[Mu]^4 (-1+4 \[Sigma]^4)^3+10395 (-1+4 \[Sigma]^4)^5)
\[HBar]^11-7280 I p^3 \[Sigma]^6 (64 \[Mu]^12+23760 \[Mu]^8 (1-4 \[Sigma]^4)^2+207900
\[Mu]^4 (1-4 \[Sigma]^4)^4+10395 (1-4 \[Sigma]^4)^6+2112 \[Mu]^10 (-1+4
\[Sigma]^4)+110880 \[Mu]^6 (-1+4 \[Sigma]^4)^3+124740 \[Mu]^2 (-1+4 \[Sigma]^4)^5)
\[HBar]^12-840 p^2 \[Mu] \[Sigma]^4 (64 \[Mu]^12+34320 \[Mu]^8 (1-4 \[Sigma]^4)^2+540540
\[Mu]^4 (1-4 \[Sigma]^4)^4+135135 (1-4 \[Sigma]^4)^6+2496 \[Mu]^10 (-1+4
\[Sigma]^4)+205920 \[Mu]^6 (-1+4 \[Sigma]^4)^3+540540 \[Mu]^2 (-1+4 \[Sigma]^4)^5)
\[HBar]^13+30 I p \[Sigma]^2 (128 \[Mu]^14+96096 \[Mu]^10 (1-4 \[Sigma]^4)^2+2522520
\[Mu]^6 (1-4 \[Sigma]^4)^4+1891890 \[Mu]^2 (1-4 \[Sigma]^4)^6+5824 \[Mu]^12 (-1+4
\[Sigma]^4)+720720 \[Mu]^8 (-1+4 \[Sigma]^4)^3+3783780 \[Mu]^4 (-1+4
\[Sigma]^4)^5+135135 (-1+4 \[Sigma]^4)^7) \[HBar]^14+\[Mu] (128 \[Mu]^14+131040 \[Mu]^10
(1-4 \[Sigma]^4)^2+5405400 \[Mu]^6 (1-4 \[Sigma]^4)^4+9459450 \[Mu]^2 (1-4
\[Sigma]^4)^6+6720 \[Mu]^12 (-1+4 \[Sigma]^4)+1201200 \[Mu]^8 (-1+4
\[Sigma]^4)^3+11351340 \[Mu]^4 (-1+4 \[Sigma]^4)^5+2027025 (-1+4 \[Sigma]^4)^7)
\[HBar]^15)

          """

function split_input(s::AbstractString)
    s = strip(s) * "\n\n"
    strings = String[]
    curr_string_lines = String[]
    for line in eachline(IOBuffer(s))
        line = strip(line)

        if isempty(line)
            push!(strings, join(curr_string_lines, " "))
            empty!(curr_string_lines)
        else
            push!(curr_string_lines, line)
        end
    end
    return strings
end

function wolfram_to_jl_str(s::AbstractString)::String
    @as s s begin
        strip(s)
        replace(s, r"^(?:\d+:\s*)?" => "")
        replace(s, r"\\\[(\w+?)\]" => s"\1")
        replace(s, r"\s+" => "*")
        replace(s, "n!" => "factorial(n)")
        replace(s, r"Sigma|Mu" => lowercase)
        replace(s, "-1+4*sigma^4" => "(s4_)^4")
        replace(s, "HBar" => "H_BAR")
        replace(s, r"\bI\b" => "Complex.i")
    end
end

exprs = strings |> split_input .|> wolfram_to_jl_str .|> Meta.parse
nothing
# println(exprs)
# %%

function expr_to_js_str(expr::Expr)
    (; head, args) = expr

    if head == :(.)
        return "$(args[1]).$(args[2].value)"
    elseif head == :call
        (op, rest...) = args

        func = if op == :(+)
            "Complex.add"
        elseif op == :(-)
            "Complex.sub"
        elseif op == :(*)
            "Complex.mul"
        elseif op == :(/)
            "Complex.div"
        elseif op == :(^)
            "Complex.pow"
        else
            string(op)
        end

        if op == :(^) && rest[1] == :(E)
            func = "Complex.exp"
            rest = rest[2:end]
        end

        js_string = join([func, "(", ("($(expr_to_js_str(ex)))," for ex in rest)..., ")"])
        return js_string
    else
        error("unrecognized head $(head)")
    end
end

function expr_to_js_str(x)
    return string(x)
end

function exprs_to_switch_case(exprs, n_min)
    comps = ["switch(n){"]
    for (n, ex) in zip(Iterators.countfrom(n_min, 1), exprs)
        push!(comps, "case $(n):\n return Complex.mul(coef_, $(expr_to_js_str(ex)));")
    end
    push!(comps, "}")
    return join(comps, "\n")
end

exprs_to_switch_case(exprs) = exprs_to_switch_case(exprs, 0)

function exprs_to_js_source(exprs)
    constCoef = raw"""
    (2^(3/4) \[Sigma]^(1/2))/(((2^n n!)^(1/2) (2 \[Sigma]^2+1)^(n+1/2) \[HBar]^n) E^((\[Mu]^2 \[HBar]^2+2 p^2 \[Sigma]^2+4 I \[Mu] p \[Sigma]^2 \[HBar])/(2 (2 \[Sigma]^2+1) \[HBar]^2)))"""
    constCoefJs = constCoef |> wolfram_to_jl_str |> Meta.parse |> expr_to_js_str
    println(constCoefJs)

    comps = [
        "/* global Complex H_BAR */",
        "",
        """function factorial(n) {
            let acc = 1;
            for (let i = 1; i <= n; i++) {
                acc *= i;
            }
            return acc;
        }
        """,
        "",
        "// eslint-disable-next-line no-unused-vars",
        "function basisCoefficient(n,{mu, sigma, p}) {",
        "const coef_ = $(constCoefJs);",
        "const s4_ = -1+4*sigma**4;",
        "switch(n){",
    ]
    for (n, ex) in zip(Iterators.countfrom(0, 1), exprs)
        push!(comps, "case $(n):\n return Complex.mul(coef_, $(expr_to_js_str(ex)));")
    end
    push!(comps, "default: throw new Error(\"Got n greater than N_MAX\")", "}", "}")
    return join(comps, "\n")
end

dump(exprs[1:2])

write(joinpath(@__DIR__, "basis_coef.js"), exprs_to_js_source(exprs))

# %%
hermitians = """0: 1

1: 2 x

2: -2+4 x^2

3: -12 x+8 x^3

4: 12-48 x^2+16 x^4

5: 120 x-160 x^3+32 x^5

6: -120+720 x^2-480 x^4+64 x^6

7: -1680 x+3360 x^3-1344 x^5+128 x^7

8: 1680-13440 x^2+13440 x^4-3584 x^6+256 x^8

9: 30240 x-80640 x^3+48384 x^5-9216 x^7+512 x^9

10: -30240+302400 x^2-403200 x^4+161280 x^6-23040 x^8+1024 x^10

11: -665280 x+2217600 x^3-1774080 x^5+506880 x^7-56320 x^9+2048 x^11

12: 665280-7983360 x^2+13305600 x^4-7096320 x^6+1520640 x^8-135168 x^10+4096 x^12

13: 17297280 x-69189120 x^3+69189120 x^5-26357760 x^7+4392960 x^9-319488 x^11+8192 x^13

14: -17297280+242161920 x^2-484323840 x^4+322882560 x^6-92252160 x^8+12300288 x^10-745472 x^12+16384 x^14

15: -518918400 x+2421619200 x^3-2905943040 x^5+1383782400 x^7-307507200 x^9+33546240 x^11-1720320 x^13+32768 x^15"""

println(
    hermitians |> split_input .|> wolfram_to_jl_str .|> Meta.parse |> exprs_to_switch_case
)
