CC=g++ -std=c++20
CFLAGS=-g -c 

TARGET1=clientlib/libclient.a 
TARGET2=CoordinatorCore/libcoord.a
TARGET3=CoordinatorCore/coordinator.exe
TARGET4=pub-sub-examples/pub_skt_main.exe 
TARGET5=pub-sub-examples/sub_skt_main.exe 
TARGET6=MasterProcess.exe


TARGET:${TARGET1} ${TARGET2} ${TARGET3} ${TARGET4} ${TARGET5} ${TARGET6} 

COORDINATOR_OBJS=CoordinatorCore/coord_start.o \
										  CoordinatorCore/coord_msg.o \
										  CoordinatorCore/coordDb.o \
										  CoordinatorCore/CoordDistribution.o \
										  Common/cmsgOp.o \
										  Libs/PostgresLibpq/postgresLib.o 

#standard libs
STLIBS=-lpq -lpthread

CLIIENTLIBS=-Lclientlib -lclient
COORDINATOR_LIBS=-LCoordinatorCore -lcoord

${TARGET1}:clientlib/client.o Common/cmsgOp.o
	@echo "Building client library"
	ar rcs ${TARGET1} clientlib/client.o Common/cmsgOp.o

${TARGET2}:${COORDINATOR_OBJS}
	@echo "Building coordinator library"
	ar rcs ${TARGET2} ${COORDINATOR_OBJS}

${TARGET3}:CoordinatorCore/coord_main.o ${COORDINATOR_OBJS}
	@echo "Building coordinator executable"
	${CC} -g CoordinatorCore/coord_main.o ${COORDINATOR_OBJS} -o ${TARGET3} ${STLIBS}

${TARGET4}:pub-sub-examples/pub_skt_main.o pub-sub-examples/pub_skt_example.o ${TARGET1}
	@echo "Building publisher socket executable"
	${CC} -g pub-sub-examples/pub_skt_main.o pub-sub-examples/pub_skt_example.o -o ${TARGET4} ${CLIIENTLIBS} ${STLIBS}

${TARGET5}:pub-sub-examples/sub_skt_main.o pub-sub-examples/sub_skt_example.o ${TARGET1} ${TARGET2}
	@echo "Building subscriber socket executable"
	${CC} -g pub-sub-examples/sub_skt_main.o pub-sub-examples/sub_skt_example.o -o ${TARGET5} ${CLIIENTLIBS} ${STLIBS}
 
${TARGET6}:MasterProcess.o pub-sub-examples/pub_skt_example.o pub-sub-examples/sub_skt_example.o pub-sub-examples/sub_cbk_example.o pub-sub-examples/pub_cbk_example.o Common/clientcommon.o ${TARGET1} ${TARGET2}
	@echo "Building MasterProcess executable"
	${CC} -g MasterProcess.o pub-sub-examples/pub_skt_example.o pub-sub-examples/sub_skt_example.o pub-sub-examples/sub_cbk_example.o pub-sub-examples/pub_cbk_example.o Common/clientcommon.o -o ${TARGET6} ${CLIIENTLIBS} ${COORDINATOR_LIBS} ${STLIBS} 

CoordinatorCore/coord_main.o:CoordinatorCore/coord_main.cpp
	${CC} ${CFLAGS} CoordinatorCore/coord_main.cpp -o CoordinatorCore/coord_main.o

CoordinatorCore/coord_start.o:CoordinatorCore/coord_start.cpp
	${CC} ${CFLAGS} CoordinatorCore/coord_start.cpp -o CoordinatorCore/coord_start.o

CoordinatorCore/coord_msg.o:CoordinatorCore/coord_msg.cpp
	${CC} ${CFLAGS} CoordinatorCore/coord_msg.cpp -o CoordinatorCore/coord_msg.o

CoordinatorCore/coordDb.o:CoordinatorCore/coordDb.cpp
	${CC} ${CFLAGS} CoordinatorCore/coordDb.cpp -o CoordinatorCore/coordDb.o

CoordinatorCore/CoordDistribution.o:CoordinatorCore/CoordDistribution.cpp
	${CC} ${CFLAGS} CoordinatorCore/CoordDistribution.cpp -o CoordinatorCore/CoordDistribution.o

Common/cmsgOp.o:Common/cmsgOp.cpp
	${CC} ${CFLAGS} Common/cmsgOp.cpp -o Common/cmsgOp.o

Common/clientcommon.o:Common/clientcommon.cpp
	${CC} ${CFLAGS} Common/clientcommon.cpp -o Common/clientcommon.o

Libs/PostgresLibpq/postgresLib.o:Libs/PostgresLibpq/postgresLib.cpp 
	${CC} ${CFLAGS} Libs/PostgresLibpq/postgresLib.cpp -o Libs/PostgresLibpq/postgresLib.o

clientlib/client.o:clientlib/client.cpp
	${CC} ${CFLAGS} clientlib/client.cpp -o clientlib/client.o

clientlib/clientcommon.o:clientlib/clientcommon.cpp
	${CC} ${CFLAGS} clientlib/clientcommon.cpp -o clientlib/clientcommon.o

pub-sub-examples/pub_skt_example.o:pub-sub-examples/pub_skt_example.cpp
	${CC} ${CFLAGS} pub-sub-examples/pub_skt_example.cpp -o pub-sub-examples/pub_skt_example.o

pub-sub-examples/pub_cbk_example.o:pub-sub-examples/pub_cbk_example.cpp
	${CC} ${CFLAGS} pub-sub-examples/pub_cbk_example.cpp -o pub-sub-examples/pub_cbk_example.o

pub-sub-examples/sub_cbk_example.o:pub-sub-examples/sub_cbk_example.cpp
	${CC} ${CFLAGS} pub-sub-examples/sub_cbk_example.cpp -o pub-sub-examples/sub_cbk_example.o

pub-sub-examples/sub_skt_example.o:pub-sub-examples/sub_skt_example.cpp
	${CC} ${CFLAGS} pub-sub-examples/sub_skt_example.cpp -o pub-sub-examples/sub_skt_example.o

pub-sub-examples/pub_skt_main.o:pub-sub-examples/pub_skt_main.cpp
	${CC} ${CFLAGS} pub-sub-examples/pub_skt_main.cpp -o pub-sub-examples/pub_skt_main.o

pub-sub-examples/sub_skt_main.o:pub-sub-examples/sub_skt_main.cpp
	${CC} ${CFLAGS} pub-sub-examples/sub_skt_main.cpp -o pub-sub-examples/sub_skt_main.o

MasterProcess.o:MasterProcess.cpp
	${CC} ${CFLAGS} MasterProcess.cpp -o MasterProcess.o

clean:
	rm -f *.a
	rm -f *.exe
	rm -f *.o 
	rm -f Libs/PostgresLibpq/*.o
	rm -f Libs/PostgresLibpq/*.a
	rm -f Common/*.o
	rm -f Common/*.a
	rm -f clientlib/*.o
	rm -f clientlib/*.a
	rm -f clientlib/*.exe
	rm -f CoordinatorCore/*.o
	rm -f CoordinatorCore/*.a
	rm -f CoordinatorCore/*.exe
	rm -f pub-sub-examples/*.o 
	rm -f pub-sub-examples/*.exe
	