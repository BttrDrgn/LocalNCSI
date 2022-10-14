int main(int argc, char* argv[])
{
#ifdef WIN32
	SetConsoleTitleA(APPNAME);
#endif

	httplib::Server server;

	server.Get("/", [](const auto& req, auto& res)
	{
		res.set_content("LocalNCSI Server", "text/plain");
		res.status = 200;
	});

	server.Get("/ncsi.txt", [](const auto& req, auto& res)
	{
		res.set_content("Microsoft NCSI", "text/plain");
		res.status = 200;
	});

	server.Get("/connecttest.txt", [](const auto& req, auto& res)
	{
		res.set_content("Microsoft Connect Test", "text/plain");
		res.status = 200;
	});

	server.listen("localhost", 80);
	return 0;
}
