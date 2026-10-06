select c03q07.p.a1
from
    c03q07.p,
    c03q07.r1,
    c03q07.r2
where
    c03q07.p.a1 = c03q07.r1.a1
    or c03q07.p.a1 = c03q07.r2.a1
