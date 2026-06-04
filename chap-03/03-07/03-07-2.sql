select
  misc.p.a1
from
  misc.p,
  misc.r1,
  misc.r2
where
  misc.p.a1 = misc.r1.a1
  or misc.p.a1 = misc.r2.a1;