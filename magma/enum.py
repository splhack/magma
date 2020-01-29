import magma as m
from .bits import BitsMeta, Bits
from enum import Enum as pyEnum



class EnumMeta(BitsMeta):
    def __new__(mcs, name, bases, attrs, **kwargs):
        cls = super().__new__(mcs, name, bases, attrs, **kwargs)
        fields = {}
        for key, value in attrs.items():
            if key[:2] == "__" or key == "_info_":
                continue
            if key == "orig_name":
                continue
            fields[key] = value
        if not fields:
            return cls
        for field in fields:
            if field == "N":
                # TODO: Make N unreserved
                raise ValueError("N is a reserved name in Enum")
        max_value = max(value for value in fields.values())
        num_bits = max(max_value.bit_length(), 1)
        type_ = cls[num_bits]
        type_._is_magma_enum = True
        for key, value in fields.items():
            setattr(type_, key, m.bits(value, num_bits))
        return type_


class Enum(Bits, metaclass=EnumMeta):
    pass


# def Enum(**kwargs):
#     max_value = max(value for value in kwargs.values())
#     num_bits = max(max_value.bit_length(), 1)
#     type_ = m.Bits[num_bits]
#     for key, value in kwargs.items():
#         setattr(type_, key, m.bits(value, num_bits))
#     return type_
