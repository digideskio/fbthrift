#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

from libcpp.memory cimport shared_ptr, make_shared, unique_ptr, make_unique
from libcpp.string cimport string
from libcpp cimport bool as cbool
from cpython cimport bool as pbool
from libc.stdint cimport int8_t, int16_t, int32_t, int64_t
from libcpp.vector cimport vector
from libcpp.set cimport set as cset
from libcpp.map cimport map as cmap
from cython.operator cimport dereference as deref
from cpython.ref cimport PyObject
from thrift.lib.py3.thrift_server cimport (
  ServiceInterface,
  cTApplicationException
)
from folly_futures cimport cFollyPromise, cFollyUnit, c_unit
cimport py3.module_types
import py3.module_types

import asyncio
import functools
import sys
import traceback

from py3.module_services_wrapper cimport cMyServiceInterface
from py3.module_services_wrapper cimport cMyServiceFastInterface
from py3.module_services_wrapper cimport cMyServiceEmptyInterface
from py3.module_services_wrapper cimport cMyServicePrioParentInterface
from py3.module_services_wrapper cimport cMyServicePrioChildInterface


cdef extern from "<utility>" namespace "std":
    cdef cFollyPromise[cFollyUnit] move(cFollyPromise[cFollyUnit])
    cdef cFollyPromise[unique_ptr[string]] move(cFollyPromise[unique_ptr[string]])
    cdef cFollyPromise[cbool] move(cFollyPromise[cbool])

cdef class Promise_void:
    cdef cFollyPromise[cFollyUnit] cPromise

    @staticmethod
    cdef create(cFollyPromise[cFollyUnit] cPromise):
        inst = <Promise_void>Promise_void.__new__(Promise_void)
        inst.cPromise = move(cPromise)
        return inst

cdef class Promise_string:
    cdef cFollyPromise[unique_ptr[string]] cPromise

    @staticmethod
    cdef create(cFollyPromise[unique_ptr[string]] cPromise):
        inst = <Promise_string>Promise_string.__new__(Promise_string)
        inst.cPromise = move(cPromise)
        return inst

cdef class Promise_bool:
    cdef cFollyPromise[cbool] cPromise

    @staticmethod
    cdef create(cFollyPromise[cbool] cPromise):
        inst = <Promise_bool>Promise_bool.__new__(Promise_bool)
        inst.cPromise = move(cPromise)
        return inst

cdef public void call_cy_MyService_ping(
    object self,
    cFollyPromise[cFollyUnit] cPromise
) with gil:
    promise = Promise_void.create(move(cPromise))
    asyncio.run_coroutine_threadsafe(
        MyService_ping_coro(
            self,
            promise),
        loop=self.loop)

async def MyService_ping_coro(
    object self,
    Promise_void promise
):
    try:
      result = await self.ping()
    except Exception as ex:
        print(
            "Unexpected error in service handler ping:",
            file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            repr(ex).encode('UTF-8')
        ))
    else:
        promise.cPromise.setValue(c_unit)

cdef public void call_cy_MyService_getRandomData(
    object self,
    cFollyPromise[unique_ptr[string]] cPromise
) with gil:
    promise = Promise_string.create(move(cPromise))
    asyncio.run_coroutine_threadsafe(
        MyService_getRandomData_coro(
            self,
            promise),
        loop=self.loop)

async def MyService_getRandomData_coro(
    object self,
    Promise_string promise
):
    try:
      result = await self.getRandomData()
    except Exception as ex:
        print(
            "Unexpected error in service handler getRandomData:",
            file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            repr(ex).encode('UTF-8')
        ))
    else:
        promise.cPromise.setValue(make_unique[string](<string?> result.encode('UTF-8')))

cdef public void call_cy_MyService_hasDataById(
    object self,
    cFollyPromise[cbool] cPromise,
    int64_t id
) with gil:
    promise = Promise_bool.create(move(cPromise))
    arg_id = id
    asyncio.run_coroutine_threadsafe(
        MyService_hasDataById_coro(
            self,
            promise,
            arg_id),
        loop=self.loop)

async def MyService_hasDataById_coro(
    object self,
    Promise_bool promise,
    id
):
    try:
      result = await self.hasDataById(
          id)
    except Exception as ex:
        print(
            "Unexpected error in service handler hasDataById:",
            file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            repr(ex).encode('UTF-8')
        ))
    else:
        promise.cPromise.setValue(<cbool> result)

cdef public void call_cy_MyService_getDataById(
    object self,
    cFollyPromise[unique_ptr[string]] cPromise,
    int64_t id
) with gil:
    promise = Promise_string.create(move(cPromise))
    arg_id = id
    asyncio.run_coroutine_threadsafe(
        MyService_getDataById_coro(
            self,
            promise,
            arg_id),
        loop=self.loop)

async def MyService_getDataById_coro(
    object self,
    Promise_string promise,
    id
):
    try:
      result = await self.getDataById(
          id)
    except Exception as ex:
        print(
            "Unexpected error in service handler getDataById:",
            file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            repr(ex).encode('UTF-8')
        ))
    else:
        promise.cPromise.setValue(make_unique[string](<string?> result.encode('UTF-8')))

cdef public void call_cy_MyService_putDataById(
    object self,
    cFollyPromise[cFollyUnit] cPromise,
    int64_t id,
    unique_ptr[string] data
) with gil:
    promise = Promise_void.create(move(cPromise))
    arg_id = id
    arg_data = (deref(data.get())).decode()
    asyncio.run_coroutine_threadsafe(
        MyService_putDataById_coro(
            self,
            promise,
            arg_id,
            arg_data),
        loop=self.loop)

async def MyService_putDataById_coro(
    object self,
    Promise_void promise,
    id,
    data
):
    try:
      result = await self.putDataById(
          id,
          data)
    except Exception as ex:
        print(
            "Unexpected error in service handler putDataById:",
            file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            repr(ex).encode('UTF-8')
        ))
    else:
        promise.cPromise.setValue(c_unit)

cdef public void call_cy_MyService_lobDataById(
    object self,
    cFollyPromise[cFollyUnit] cPromise,
    int64_t id,
    unique_ptr[string] data
) with gil:
    promise = Promise_void.create(move(cPromise))
    arg_id = id
    arg_data = (deref(data.get())).decode()
    asyncio.run_coroutine_threadsafe(
        MyService_lobDataById_coro(
            self,
            promise,
            arg_id,
            arg_data),
        loop=self.loop)

async def MyService_lobDataById_coro(
    object self,
    Promise_void promise,
    id,
    data
):
    try:
      result = await self.lobDataById(
          id,
          data)
    except Exception as ex:
        print(
            "Unexpected error in service handler lobDataById:",
            file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            repr(ex).encode('UTF-8')
        ))
    else:
        promise.cPromise.setValue(c_unit)

cdef public void call_cy_MyServiceFast_ping(
    object self,
    cFollyPromise[cFollyUnit] cPromise
) with gil:
    promise = Promise_void.create(move(cPromise))
    asyncio.run_coroutine_threadsafe(
        MyServiceFast_ping_coro(
            self,
            promise),
        loop=self.loop)

async def MyServiceFast_ping_coro(
    object self,
    Promise_void promise
):
    try:
      result = await self.ping()
    except Exception as ex:
        print(
            "Unexpected error in service handler ping:",
            file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            repr(ex).encode('UTF-8')
        ))
    else:
        promise.cPromise.setValue(c_unit)

cdef public void call_cy_MyServiceFast_getRandomData(
    object self,
    cFollyPromise[unique_ptr[string]] cPromise
) with gil:
    promise = Promise_string.create(move(cPromise))
    asyncio.run_coroutine_threadsafe(
        MyServiceFast_getRandomData_coro(
            self,
            promise),
        loop=self.loop)

async def MyServiceFast_getRandomData_coro(
    object self,
    Promise_string promise
):
    try:
      result = await self.getRandomData()
    except Exception as ex:
        print(
            "Unexpected error in service handler getRandomData:",
            file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            repr(ex).encode('UTF-8')
        ))
    else:
        promise.cPromise.setValue(make_unique[string](<string?> result.encode('UTF-8')))

cdef public void call_cy_MyServiceFast_hasDataById(
    object self,
    cFollyPromise[cbool] cPromise,
    int64_t id
) with gil:
    promise = Promise_bool.create(move(cPromise))
    arg_id = id
    asyncio.run_coroutine_threadsafe(
        MyServiceFast_hasDataById_coro(
            self,
            promise,
            arg_id),
        loop=self.loop)

async def MyServiceFast_hasDataById_coro(
    object self,
    Promise_bool promise,
    id
):
    try:
      result = await self.hasDataById(
          id)
    except Exception as ex:
        print(
            "Unexpected error in service handler hasDataById:",
            file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            repr(ex).encode('UTF-8')
        ))
    else:
        promise.cPromise.setValue(<cbool> result)

cdef public void call_cy_MyServiceFast_getDataById(
    object self,
    cFollyPromise[unique_ptr[string]] cPromise,
    int64_t id
) with gil:
    promise = Promise_string.create(move(cPromise))
    arg_id = id
    asyncio.run_coroutine_threadsafe(
        MyServiceFast_getDataById_coro(
            self,
            promise,
            arg_id),
        loop=self.loop)

async def MyServiceFast_getDataById_coro(
    object self,
    Promise_string promise,
    id
):
    try:
      result = await self.getDataById(
          id)
    except Exception as ex:
        print(
            "Unexpected error in service handler getDataById:",
            file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            repr(ex).encode('UTF-8')
        ))
    else:
        promise.cPromise.setValue(make_unique[string](<string?> result.encode('UTF-8')))

cdef public void call_cy_MyServiceFast_putDataById(
    object self,
    cFollyPromise[cFollyUnit] cPromise,
    int64_t id,
    unique_ptr[string] data
) with gil:
    promise = Promise_void.create(move(cPromise))
    arg_id = id
    arg_data = (deref(data.get())).decode()
    asyncio.run_coroutine_threadsafe(
        MyServiceFast_putDataById_coro(
            self,
            promise,
            arg_id,
            arg_data),
        loop=self.loop)

async def MyServiceFast_putDataById_coro(
    object self,
    Promise_void promise,
    id,
    data
):
    try:
      result = await self.putDataById(
          id,
          data)
    except Exception as ex:
        print(
            "Unexpected error in service handler putDataById:",
            file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            repr(ex).encode('UTF-8')
        ))
    else:
        promise.cPromise.setValue(c_unit)

cdef public void call_cy_MyServiceFast_lobDataById(
    object self,
    cFollyPromise[cFollyUnit] cPromise,
    int64_t id,
    unique_ptr[string] data
) with gil:
    promise = Promise_void.create(move(cPromise))
    arg_id = id
    arg_data = (deref(data.get())).decode()
    asyncio.run_coroutine_threadsafe(
        MyServiceFast_lobDataById_coro(
            self,
            promise,
            arg_id,
            arg_data),
        loop=self.loop)

async def MyServiceFast_lobDataById_coro(
    object self,
    Promise_void promise,
    id,
    data
):
    try:
      result = await self.lobDataById(
          id,
          data)
    except Exception as ex:
        print(
            "Unexpected error in service handler lobDataById:",
            file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            repr(ex).encode('UTF-8')
        ))
    else:
        promise.cPromise.setValue(c_unit)

cdef public void call_cy_MyServicePrioParent_ping(
    object self,
    cFollyPromise[cFollyUnit] cPromise
) with gil:
    promise = Promise_void.create(move(cPromise))
    asyncio.run_coroutine_threadsafe(
        MyServicePrioParent_ping_coro(
            self,
            promise),
        loop=self.loop)

async def MyServicePrioParent_ping_coro(
    object self,
    Promise_void promise
):
    try:
      result = await self.ping()
    except Exception as ex:
        print(
            "Unexpected error in service handler ping:",
            file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            repr(ex).encode('UTF-8')
        ))
    else:
        promise.cPromise.setValue(c_unit)

cdef public void call_cy_MyServicePrioParent_pong(
    object self,
    cFollyPromise[cFollyUnit] cPromise
) with gil:
    promise = Promise_void.create(move(cPromise))
    asyncio.run_coroutine_threadsafe(
        MyServicePrioParent_pong_coro(
            self,
            promise),
        loop=self.loop)

async def MyServicePrioParent_pong_coro(
    object self,
    Promise_void promise
):
    try:
      result = await self.pong()
    except Exception as ex:
        print(
            "Unexpected error in service handler pong:",
            file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            repr(ex).encode('UTF-8')
        ))
    else:
        promise.cPromise.setValue(c_unit)

cdef public void call_cy_MyServicePrioChild_pang(
    object self,
    cFollyPromise[cFollyUnit] cPromise
) with gil:
    promise = Promise_void.create(move(cPromise))
    asyncio.run_coroutine_threadsafe(
        MyServicePrioChild_pang_coro(
            self,
            promise),
        loop=self.loop)

async def MyServicePrioChild_pang_coro(
    object self,
    Promise_void promise
):
    try:
      result = await self.pang()
    except Exception as ex:
        print(
            "Unexpected error in service handler pang:",
            file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            repr(ex).encode('UTF-8')
        ))
    else:
        promise.cPromise.setValue(c_unit)


cdef class MyServiceInterface(ServiceInterface):
    def __cinit__(self):
        self.interface_wrapper = cMyServiceInterface(<PyObject *> self)

    def __init__(self, loop=None):
        self.loop = loop or asyncio.get_event_loop()

    async def ping(
            self):
        raise NotImplementedError("async def ping is not implemented")


    async def getRandomData(
            self):
        raise NotImplementedError("async def getRandomData is not implemented")


    async def hasDataById(
            self,
            id):
        raise NotImplementedError("async def hasDataById is not implemented")


    async def getDataById(
            self,
            id):
        raise NotImplementedError("async def getDataById is not implemented")


    async def putDataById(
            self,
            id,
            data):
        raise NotImplementedError("async def putDataById is not implemented")


    async def lobDataById(
            self,
            id,
            data):
        raise NotImplementedError("async def lobDataById is not implemented")


cdef class MyServiceFastInterface(ServiceInterface):
    def __cinit__(self):
        self.interface_wrapper = cMyServiceFastInterface(<PyObject *> self)

    def __init__(self, loop=None):
        self.loop = loop or asyncio.get_event_loop()

    async def ping(
            self):
        raise NotImplementedError("async def ping is not implemented")


    async def getRandomData(
            self):
        raise NotImplementedError("async def getRandomData is not implemented")


    async def hasDataById(
            self,
            id):
        raise NotImplementedError("async def hasDataById is not implemented")


    async def getDataById(
            self,
            id):
        raise NotImplementedError("async def getDataById is not implemented")


    async def putDataById(
            self,
            id,
            data):
        raise NotImplementedError("async def putDataById is not implemented")


    async def lobDataById(
            self,
            id,
            data):
        raise NotImplementedError("async def lobDataById is not implemented")


cdef class MyServiceEmptyInterface(ServiceInterface):
    def __cinit__(self):
        self.interface_wrapper = cMyServiceEmptyInterface(<PyObject *> self)

    def __init__(self, loop=None):
        self.loop = loop or asyncio.get_event_loop()

cdef class MyServicePrioParentInterface(ServiceInterface):
    def __cinit__(self):
        self.interface_wrapper = cMyServicePrioParentInterface(<PyObject *> self)

    def __init__(self, loop=None):
        self.loop = loop or asyncio.get_event_loop()

    async def ping(
            self):
        raise NotImplementedError("async def ping is not implemented")


    async def pong(
            self):
        raise NotImplementedError("async def pong is not implemented")


cdef class MyServicePrioChildInterface(ServiceInterface):
    def __cinit__(self):
        self.interface_wrapper = cMyServicePrioChildInterface(<PyObject *> self)

    def __init__(self, loop=None):
        self.loop = loop or asyncio.get_event_loop()

    async def pang(
            self):
        raise NotImplementedError("async def pang is not implemented")


