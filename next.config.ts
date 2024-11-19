import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  serverExternalPackages: ["prisma", "bcrypt"],
};

export default nextConfig;
