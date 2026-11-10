export default {
    async fetch(request, env, ctx) {
        const url = new URL(request.url);
        const path = url.pathname;

        // Serve static assets from the assets directory
        try {
            const asset = await env.ASSETS.fetch(request);
            if (asset.status !== 404) {
                return asset;
            }
        } catch (e) {
            // Asset not found, fall through to SPA routing
        }

        // SPA routing - serve index.html for all non-asset routes
        if (!path.includes('.')) {
            return env.ASSETS.fetch(new Request('https://' + url.host + '/index.html', request));
        }

        return new Response('Not found', { status: 404 });
    },
};
