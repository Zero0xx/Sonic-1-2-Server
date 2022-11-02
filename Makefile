CXXFLAGS_ALL = $(CXXFLAGS) \
               -DBASE_PATH='"$(BASE_PATH)"' \
               -I../dependencies/all/asio/include/

LDFLAGS_ALL = $(LDFLAGS)
LIBS_ALL = -pthread $(LIBS)

SOURCES = Server.cpp

objects/%.o: %
	mkdir -p $(@D)
	$(CXX) $(CXXFLAGS_ALL) -std=c++17 $^ -o $@ -c

Server: $(SOURCES:%=objects/%.o)
	mkdir -p $(@D)
	$(CXX) $(CXXFLAGS_ALL) $(LDFLAGS_ALL) $^ -o $@ $(LIBS_ALL)

clean:
	rm -r -f Server && rm -r -f objects
