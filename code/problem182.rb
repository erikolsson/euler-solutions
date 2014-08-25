def mod_pow(base, power, mod)
	res = 1
	while power > 0
		res	= (res * base) % mod if power & 1 == 1
		power >>= 1
	end
	res
end


def greatest_common_divisor (a, b)
	# Euclid's Algorithm
	while b != 0
		t = b
		b = a % b
		a = t
	end

	return a
end

def encrypt(message, n, e)
	c = mod_pow(message, e, n)
	c
end

def decrypt(message, d, n)
	m = mod_pow(message, d, n)
	m
end

def extended_gcd(a, b)
	return [0,1] if a % b == 0
	x,y = extended_gcd(b, a % b)
	[y, x-y*(a / b)]
end

def get_d(p,q,e)
	phi = (p-1)*(q-1)
	x,y = extended_gcd(e,phi)
	x += phi if x<0
	x
end

p = 1009
q = 3643

n = p * q
phi = (p-1) * (q-1)
e = 24
i = 0
loop do
	if greatest_common_divisor(i, phi) == 1
		puts i
		e = i
	end
	i += 1
	break if i > 10000
end

d = get_d(p,q,e)

puts "p: #{p} n: #{n} q: #{q} phi: #{phi} e: #{e} d: #{d}"

encrypted = encrypt(12, n, e)
puts "Encrypted: #{encrypted}"
decrypted = decrypt(encrypted, d, n)
puts "Decrypted: #{decrypted}"











