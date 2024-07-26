import asyncio
from aiohttp import web


async def api(request):
    return web.Response(text='mirageoais')

async def health_check(request):
    return web.Response(text='OK')

app = web.Application()
app.router.add_get('/api/v1/mirageoasis', api)
app.router.add_get('/healthcheck', health_check)

web.run_app(app)