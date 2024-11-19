import { NextRequest, NextResponse } from "next/server";


export function middleware(request: NextRequest): NextResponse {

        const user = 'asdasd';
    
        if (!user){
            return NextResponse.redirect(new URL("/login", request.url));
        }

    return NextResponse.next();
}

export const config = {
    matcher: ["/admin"],
}