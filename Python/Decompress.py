def decompress( n, fr, to ):
    if ( len( fr ) <= 0 ):
        return( to )

    cnt = 1
    
    if ( cnt < len( fr ) ):
        while ( fr[0] == fr[cnt] ):
            #print("cnt = ", cnt)
            cnt += 1
            if ( len(fr) <= cnt ):
                break

    return( decompress( len(fr)-cnt, fr[cnt:], to + str(cnt) + fr[0] ) )


buf = '1'

for i in range( 10 ):
    print( buf )
    buf = decompress( len(buf), buf, '')

print("END")